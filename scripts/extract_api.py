import requests
import json
from datetime import datetime
from pathlib import Path

BASE_URL = "https://fakestoreapi.com"

def extract(endpoint):

    url = f"{BASE_URL}/{endpoint}"

    response = requests.get(url)

    # Verificação de erro 
    if response.status_code != 200:
        raise Exception(f"Erro ao acessar {url}. Status: {response.status_code}.")

    data = response.json()

    # Momento da extração
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S") 

    # Caminho do arquivo
    output_dir = Path('data/raw')
    output_dir.mkdir(parents=True, exist_ok=True) # Evita erros se o caminho já existir

    file_path = output_dir / f'{endpoint}_{timestamp}.json'

    # With: Fecha o arquivo automaticamente após executar o código
    with open(file_path, 'w', encoding='utf_8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f'{endpoint} salvo com sucesso em {file_path}!')

if __name__ == '__main__':
    endpoints = ['products', 'users', 'carts']

    for endpoint in endpoints:
        extract(endpoint)
