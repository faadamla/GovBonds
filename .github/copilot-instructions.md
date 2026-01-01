# Repo summary

- This repository is a small data-analysis repo focused on government bond/exchange-rate price data.
- Key files:
  - `Prices/` — raw Excel (`.xlsx`) and PDF source data (filenames like `arfolyamjegyzes-MAP-YYYY-MM-DD.HHMMSS.xlsx`).
  - `Untitled.ipynb` — the working Jupyter notebook (imports: `datetime`, `pandas as pd`, `numpy as np`).

## Quick setup (Windows)
1. Activate or create the virtual environment:
   - If `.venv` exists: PowerShell: `.\.venv\Scripts\Activate.ps1`  (or CMD: `.\.venv\Scripts\activate`).
   - To create one: `python -m venv .venv` then activate.
2. Install minimal runtime deps:
   - Preferred: `pip install -r requirements.txt` (file lists `pandas`, `numpy`, `openpyxl`, `jupyterlab`).
   - Quick alternative: `pip install pandas numpy openpyxl jupyterlab` (openpyxl is required to read the `.xlsx` files).
   - Or run the included helper: `setup_env.bat` — from the repo root run `.\\setup_env.bat` to create `.venv`, install packages and run a quick environment check (works from CMD; PowerShell will execute the .bat via cmd).
3. Open the notebook: `jupyter lab` or open `Untitled.ipynb` in VS Code.

### Troubleshooting
- If `Activate.ps1` fails on Windows with "running scripts is disabled" (PowerShell execution policy):
  - Use the CMD activation instead: `\.venv\Scripts\activate` (run in Command Prompt).
  - Or run packages without activation: `python -m pip install -r requirements.txt` and run scripts with the venv python: `\.venv\Scripts\python.exe scripts\check_env.py`.
  - If you prefer PowerShell activation, you can enable scripts for the current user (example):
    `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` (requires admin privileges and changes the policy).
  - Note: prefer the CMD or direct `python -m pip` approaches if you cannot change system policies.

## Local conventions & discoverable patterns
- Data is committed under `Prices/`. Filenames are date/timestamped and appear to be authoritative raw inputs — avoid editing them in-place.
- Current analysis work lives in notebooks (no `src/` or `tests/` directories present).
- Example data access pattern (from the repo notebook):

```python
import pandas as pd
df = pd.read_excel('Prices/arfolyamjegyzes-MAP-2026-01-01.192151.xlsx')
```

- Typical imports seen in `Untitled.ipynb`:
  - `import datetime`
  - `import pandas as pd`
  - `import numpy as np`

## What an AI coding agent should do first ✅
- Read `Untitled.ipynb` and inspect the `Prices/` files to understand data fields and typical transformations.
- Ensure environment reproducibility by adding a `requirements.txt` (pinning versions) if you add packages.
- When adding scripts, put them under a new folder (e.g. `scripts/` or `src/`) and keep notebooks for exploration-only.

## Debugging & testing notes 🔧
- There are no CI or test runners currently; add tests if you add logic that needs verification.
- For large Excel files, use `df.head()` and `df.dtypes` to quickly validate column parsing and types.

## Integration points / external deps
- No external services or APIs are present in the repo. The main dependency is Python packages used to load and manipulate the Excel files.

## Commit hygiene & PR tips
- Avoid committing large binary changes to files in `Prices/` unless they are new raw inputs.
- Prefer small, focused PRs that add a single script or notebook with a short explanation in the PR body.

---

If you want, I can: 1) add a `requirements.txt` with inferred packages, 2) convert the notebook imports into a minimal `scripts/load_data.py`, or 3) expand these instructions with explicit examples of common transforms found in the notebooks. Which would you like next?