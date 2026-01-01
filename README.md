# Quick install & setup (Windows) ✅

1. From the repository root, run the helper script to create `.venv`, install packages, and run a quick environment check:

```bat
.\setup_env.bat
```

Notes:
- Run from CMD or PowerShell as `.\setup_env.bat` (PowerShell runs the batch via cmd). If PowerShell blocks script execution, use CMD or run commands with the venv Python directly.

Manual alternative:

```powershell
python -m venv .venv
.\.venv\Scripts\activate   # (CMD alternative: .\.venv\Scripts\activate)
pip install -r requirements.txt
python scripts\check_env.py
```

Open the notebooks (exploration & analysis):

```powershell
jupyter lab
```