
# Automation Scripts - `main.sh`

Skrip `main.sh` ini digunakan untuk memproses folder dalam direktori tertentu dan menjalankan file JavaScript (`main.js` atau `index.js`) atau file Python (`main.py`). Skrip ini akan memeriksa apakah folder telah diproses sebelumnya dan menghindari pemrosesan ulang folder yang sama. Skrip ini juga akan menangani pengaktifan environment virtual Python jika ada, dan menjalankan file Python dengan opsi tertentu.

## Prasyarat

Sebelum menjalankan skrip ini, pastikan Anda memiliki hal-hal berikut:

- **Ubuntu (Linux) / Windows (WSL / Git Bash)**
- **Node.js** untuk menjalankan file JavaScript (`main.js` atau `index.js`).
- **Python 3** untuk menjalankan file Python (`main.py`).
- **gnome-terminal** (hanya untuk Linux, untuk membuka terminal baru saat menjalankan skrip).
- **Virtual Environment (Opsional)** untuk menjalankan skrip Python dalam environment terisolasi.

![Deskripsi Gambar](https://github.com/0xsyo/automation-scripts/blob/main/image.jpg?raw=true)


## Cara Menjalankan Skrip

### 1. **Clone Repositori Git**

Jika Anda belum meng-clone repositori ini, jalankan perintah berikut untuk meng-clone repositori ke komputer Anda:

```bash
git clone https://github.com/0xsyo/automation-scripts.git
cd automation-scripts
```

### 2. **Persiapkan Direktori `bot`**

Skrip ini mengasumsikan bahwa Anda memiliki folder `bot` atau pindahkan semua folder yang berisikan kode/script/bot ke folder automation-scripts yang berisi proyek JavaScript atau Python. 


  Anda bisa menambahkan folder proyek JavaScript atau Python di dalam folder `bot`.

- **Di Windows (menggunakan Git Bash atau WSL):** Jika Anda menggunakan Git Bash atau WSL, Anda dapat menyesuaikan jalur direktori sesuai dengan lokasi folder `bot`.

Jika Anda perlu mengubah jalur folder di dalam skrip, buka `main.sh` dan edit baris berikut:

https://github.com/0xsyo/automation-scripts/blob/6b833e9b3d86b740534698f1e4df9f5eb232cd1f/main.sh#L46

pindahkan semua folder / script atau bot pada folder `automation-scripts`


```
   automation-scripts/
   ├── main.sh
   ├── bot1/
   │   ├── main.js
   │   └── main.py
   ├── bot2/
   │   ├── index.js
   │   └── main.py
```


### 3. **Berikan Izin Eksekusi pada Skrip (Opsional)**

Jika Anda ingin menjalankan skrip secara langsung, pastikan Anda memberikan izin eksekusi pada file skrip dengan perintah:

```bash
chmod +x main.sh
```

### 4. **Menjalankan Skrip**

Setelah persiapan selesai, Anda dapat menjalankan skrip `main.sh` dengan perintah berikut:

```bash
./main.sh
```

Jika Anda tidak memberikan izin eksekusi, Anda juga bisa menjalankan skrip dengan perintah berikut:

```bash
bash main.sh
```

### 5. **Memahami Apa yang Terjadi**

- Skrip ini akan memeriksa setiap sub-folder dalam direktori `bot` yang ada di dalam repositori yang sudah Anda clone.
- Jika ada file JavaScript (`main.js` atau `index.js`), skrip akan menjalankan file tersebut menggunakan `node`.
- Jika ada file Python (`main.py`) dan sebuah virtual environment ditemukan, skrip akan mengaktifkan environment tersebut dan menjalankan `main.py` dengan parameter tambahan `--action 1`.
- Jika tidak ada file JavaScript atau Python yang ditemukan, skrip akan memberikan pemberitahuan dan melanjutkan ke folder berikutnya.

## Menambahkan Folder Baru

Untuk menambahkan folder baru ke dalam direktori `bot`, cukup buat sub-folder di dalamnya dan pastikan ada file `main.js`, `index.js`, atau `main.py` di dalamnya. Skrip akan otomatis mendeteksi dan memproses folder baru tersebut.

## Troubleshooting

- **Masalah dengan Virtual Environment:**  
  Jika Anda menggunakan Python dengan virtual environment, pastikan direktori `venv` berada di dalam folder yang sama dengan file `main.py`. Skrip akan mencari folder `venv` dan mengaktifkannya jika ditemukan.

- **Masalah dengan `gnome-terminal` (Linux):**  
  Skrip ini menggunakan `gnome-terminal` untuk membuka terminal baru saat menjalankan skrip. Jika Anda menggunakan desktop environment selain GNOME, Anda mungkin perlu mengganti `gnome-terminal` dengan terminal lain yang Anda gunakan, seperti `xterm` atau `konsole`.

## Lisensi

Skrip ini dirilis di bawah lisensi MIT.
