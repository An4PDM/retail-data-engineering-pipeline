import json
from pathlib import Path

RAW_PATH = Path("data/raw")

def load_latest_json(endpoint : str) -> list:
    files = sorted(RAW_PATH.glob(
        f"{endpoint}_*.json"
    ))


    if not files:
        raise FileNotFoundError(f"Arquivo não encontrado para {endpoint}.")
    
    latest_file = files[-1]

    with open(latest_file, "r", encoding="utf_8") as f:
        return json.load(f)
    
    
