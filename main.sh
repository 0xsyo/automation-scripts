#!/bin/bash

# Direktori root di mana semua sub-folder berada
DIR="../automation-scripts"
LOG_FILE="$DIR/run_log.txt"

# Jika file log belum ada, buat file log kosong
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi

# Fungsi untuk memeriksa apakah folder sudah diproses sebelumnya
is_folder_processed() {
    local folder_name="$1"
    grep -q "^$folder_name$" "$LOG_FILE"
}

# Fungsi untuk menandai folder telah diproses
mark_folder_as_processed() {
    local folder_name="$1"
    echo "$folder_name" >> "$LOG_FILE"
}

# Cari semua folder di level pertama dalam $DIR
for folder in "$DIR"/*/; do
    if [ -d "$folder" ]; then
        folder_name=$(basename "$folder")
        echo "Memproses folder: $folder_name"

        # Cek apakah folder ini sudah diproses sebelumnya (berada dalam file log)
        if is_folder_processed "$folder_name"; then
            echo "Folder $folder_name sudah diproses, melewatinya..."
            continue
        fi

        # Cek apakah ada file main.js atau index.js untuk proyek JavaScript
        js_file=$(find "$folder" -maxdepth 1 -type f \( -name "main.js" -o -name "index.js" \) | head -n 1)

        # Cek apakah ada file main.py untuk proyek Python
        python_file=$(find "$folder" -maxdepth 1 -type f -name "main.py" | head -n 1)

        # Jika ditemukan file JavaScript (main.js atau index.js)
        if [ -n "$js_file" ]; then
            echo "Menjalankan: $js_file di direktori $(dirname "$js_file")"
            (
                cd "$(dirname "$js_file")" || exit
                echo "Pindah ke direktori $(pwd)"

                # Set judul terminal ke nama folder
                echo -ne "\033]0;$folder_name\007"

                # Menjalankan file JavaScript menggunakan node
                gnome-terminal --title="$folder_name" -- bash -c "echo -ne '\033]0;$folder_name\007'; node $(basename "$js_file"); exec bash" &
            )
            # Menandai folder ini telah diproses dengan menambahkan ke log
            mark_folder_as_processed "$folder_name"
            sleep 7
        # Jika ditemukan file Python (main.py) dan ada virtual environment
        elif [ -n "$python_file" ]; then
            venv_path="$folder/venv"
            echo "Menjalankan: $python_file di direktori $(dirname "$python_file")"

            (
                cd "$(dirname "$python_file")" || exit
                echo "Pindah ke direktori $(pwd)"

                # Set judul terminal ke nama folder
                echo -ne "\033]0;$folder_name\007"

                if [ -d "$venv_path" ] && [ -f "$venv_path/bin/activate" ]; then
                    # Jika ada virtual environment, aktifkan venv dan jalankan main.py dengan --action 1
                    echo "Virtual environment ditemukan, mencoba mengaktifkan venv..."
                    source "$venv_path/bin/activate" || {
                        echo "Gagal mengaktifkan virtual environment di $venv_path"
                        exit 1
                    }
                    gnome-terminal --title="$folder_name" -- bash -c "echo -ne '\033]0;$folder_name\007'; python3 $(basename "$python_file") --action 1; exec bash" &
                else
                    # Jika tidak ada venv, jalankan main.py dengan python3.10
                    echo "Virtual environment tidak ditemukan, menjalankan main.py dengan python3.10"
                    gnome-terminal --title="$folder_name" -- bash -c "echo -ne '\033]0;$folder_name\007'; python3.10 $(basename "$python_file"); exec bash" &
                fi
            )
            # Menandai folder ini telah diproses dengan menambahkan ke log
            mark_folder_as_processed "$folder_name"
            sleep 3
        # Jika tidak ada file Python atau JavaScript yang ditemukan
        else
            echo "Tidak ada file main.js, index.js, atau main.py yang cocok di folder: $folder"
        fi
    fi
done

# Tunggu semua proses selesai sebelum skrip berakhir
wait
