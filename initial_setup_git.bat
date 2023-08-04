@echo off

echo Checking if Python extension is installed...
code --list-extensions | findstr /C:"ms-python.python" > nul
if %errorlevel% equ 0 (
  echo Python extension already installed.
) else (
  echo Installing Python extension...
  code --install-extension ms-python.python
)

echo Checking if Jupyter extension is installed...
code --list-extensions | findstr /C:"ms-toolsai.jupyter" > nul
if %errorlevel% equ 0 (
  echo Jupyter extension already installed.
) else (
  echo Installing Jupyter extension...
  code --install-extension ms-toolsai.jupyter
)

REM git global user.name Edit Below
git config --global user.name "utkarshg1"
git config --global user.email "gaikwadujg@gmail.com"

REM Clone github repository Edit Below
git clone "https://github.com/utkarshg1/deppoyment6PM.git" "repository"

REM copy requirements.txt to repository folder
copy requirements.txt repository

REM go into repo folder
cd repository

REM Create a virtual environment called "myenv"
python -m venv venv

REM Activate the virtual environment
call venv\Scripts\activate.bat

REM Upgrade pip
python.exe -m pip install --upgrade pip

REM Install any required packages using pip
pip install -r requirements.txt

REM Launch VS Code and ensure that it uses the virtual environment
code .

