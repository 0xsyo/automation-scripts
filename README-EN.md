# Automation Scripts - `main.sh`

The `main.sh` script is used to process folders within a specific directory and execute JavaScript files (`main.js` or `index.js`) or Python files (`main.py`). This script checks if a folder has been processed previously to avoid reprocessing the same folder. It also handles activating Python virtual environments, if available, and running Python files with specific options.

## Prerequisites

Before running this script, ensure you have the following:

- **Ubuntu (Linux) / Windows (WSL / Git Bash)**
- **Node.js** to execute JavaScript files (`main.js` or `index.js`).
- **Python 3** to execute Python files (`main.py`).
- **gnome-terminal** (Linux only, used to open new terminals during script execution).
- **Virtual Environment (Optional)** to run Python scripts in an isolated environment.

![Image Description](https://github.com/0xsyo/automation-scripts/blob/main/image.jpg?raw=true)

## How to Run the Script

### 1. **Clone the Git Repository**

If you haven’t cloned this repository yet, execute the following commands to clone it to your computer:

```bash
git clone https://github.com/0xsyo/automation-scripts.git
cd automation-scripts
```

### 2. **Prepare the `bot` Directory**

This script assumes you have a `bot` folder or have moved all folders containing code/scripts/bots into the `automation-scripts` directory, which houses JavaScript or Python projects.

You can add JavaScript or Python project folders inside the `bot` directory.

- **On Windows (using Git Bash or WSL):** If you are using Git Bash or WSL, adjust the directory path according to the location of the `bot` folder.

If you need to change the folder path in the script, open `main.sh` and edit the following line:

https://github.com/0xsyo/automation-scripts/blob/6b833e9b3d86b740534698f1e4df9f5eb232cd1f/main.sh#L46

Move all folders/scripts or bots into the `automation-scripts` folder:

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

### 3. **Grant Execution Permissions to the Script (Optional)**

If you want to execute the script directly, grant execution permissions to the script file using the command:

```bash
chmod +x main.sh
```

### 4. **Run the Script**

Once everything is set up, you can run the `main.sh` script with the following command:

```bash
./main.sh
```

If you do not grant execution permissions, you can also run the script with the command:

```bash
bash main.sh
```

### 5. **Understanding the Process**

- The script will check each sub-folder in the `bot` directory within the cloned repository.
- If a JavaScript file (`main.js` or `index.js`) is found, the script will run the file using `node`.
- If a Python file (`main.py`) is found and a virtual environment exists, the script will activate the environment and run `main.py` with additional parameters `--action 1`.
- If no JavaScript or Python files are found, the script will notify you and proceed to the next folder.

## Adding New Folders

To add a new folder to the `bot` directory, simply create a sub-folder inside it and ensure it contains a `main.js`, `index.js`, or `main.py` file. The script will automatically detect and process the new folder.

## Troubleshooting

- **Issues with Virtual Environment:**  
  If you are using Python with a virtual environment, ensure the `venv` directory is located in the same folder as the `main.py` file. The script will look for the `venv` folder and activate it if found.

- **Issues with `gnome-terminal` (Linux):**  
  This script uses `gnome-terminal` to open a new terminal during execution. If you use a desktop environment other than GNOME, you may need to replace `gnome-terminal` with the terminal application you use, such as `xterm` or `konsole`.

## License

This script is released under the MIT license.
