
# Automation Scripts - `main.sh`

The `main.sh` script is used to process folders within a specific directory and run JavaScript files (`main.js` or `index.js`) or Python files (`main.py`). The script checks whether a folder has been processed previously to avoid re-processing the same folder. It also handles activating a Python virtual environment if present and runs the Python file with certain options.

## Prerequisites

Before running this script, ensure you have the following:

- **Ubuntu (Linux) / Windows (WSL / Git Bash)**
- **Node.js** to run JavaScript files (`main.js` or `index.js`).
- **Python 3** to run Python files (`main.py`).
- **gnome-terminal** (Linux only, to open a new terminal window while running the script).
- **Virtual Environment (Optional)** to run Python scripts in an isolated environment.

## How to Run the Script

### 1. **Clone the Git Repository**

If you haven't cloned the repository yet, run the following command to clone the repository to your local machine:

```bash
git clone https://github.com/0xsyo/automation-scripts.git
cd automation-scripts
```

### 2. **Prepare the `bot` Directory**

This script assumes you have a `bot` folder containing subfolders with either JavaScript or Python projects. Ensure the `bot` folder is located inside the cloned repository, or place the `bot` folder in another suitable directory.

- **Create the `bot` folder inside the repository you just cloned:**

  ```bash
  mkdir -p automation-scripts/bot
  ```

  You can add your JavaScript or Python project folders inside the `bot` directory.

- **On Windows (using Git Bash or WSL):** If you're using Git Bash or WSL, you can adjust the directory path according to where the `bot` folder is located.

If you need to change the folder path inside the script, open `main.sh` and edit the following line:

```bash
DIR="./bot"  # Points to the 'bot' folder inside the cloned repository
```

### 3. **Grant Execute Permissions to the Script (Optional)**

If you want to run the script directly, make sure to grant execute permissions to the script file with the following command:

```bash
chmod +x main.sh
```

### 4. **Run the Script**

After the setup is complete, you can run the `main.sh` script with the following command:

```bash
./main.sh
```

If you did not grant execute permissions, you can also run the script using the following command:

```bash
bash main.sh
```

### 5. **Understanding What Happens**

- The script will check each subfolder inside the `bot` directory (in the cloned repository).
- If a JavaScript file (`main.js` or `index.js`) is found, the script will run it using `node`.
- If a Python file (`main.py`) is found and a virtual environment is detected, the script will activate the environment and run `main.py` with the additional `--action 1` argument.
- If no JavaScript or Python files are found, the script will notify you and continue to the next folder.

## Adding a New Folder

To add a new folder to the `bot` directory, simply create a subfolder inside it and make sure it contains a `main.js`, `index.js`, or `main.py` file. The script will automatically detect and process the new folder.

## Troubleshooting

- **Issues with Virtual Environment:**  
  If you're using Python with a virtual environment, ensure the `venv` directory is within the same folder as `main.py`. The script will look for the `venv` folder and activate it if found.

- **Issues with `gnome-terminal` (Linux):**  
  The script uses `gnome-terminal` to open a new terminal window while running the script. If you're using a desktop environment other than GNOME, you may need to change `gnome-terminal` to the terminal you use, such as `xterm` or `konsole`.

## License

This script is released under the MIT License.
