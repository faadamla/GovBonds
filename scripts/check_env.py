"""Simple environment checker: imports key packages and prints their versions."""

try:
    import pandas as pd
    import numpy as np
    import openpyxl
    print(f"OK: pandas={pd.__version__}, numpy={np.__version__}")
except Exception as e:
    print("Import error:", e)
    raise
