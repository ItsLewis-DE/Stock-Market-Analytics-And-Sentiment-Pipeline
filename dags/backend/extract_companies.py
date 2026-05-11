import json
import pendulum
import requests
import os,logging
from dotenv import load_dotenv

def extract_companies():
    logger = logging.getLogger(__name__)
    load_dotenv('/usr/local/env')
    exchanges = ['NYSE', 'NASDAQ', 'NYSEMKT', 'NYSEARCA', 'OTC', 'BATS', 'INDEX']
    result = []
    total =0
    for exchange in exchanges:
        try:
            params = {
                'exchange': exchange,
                'token': os.getenv('API_COMPANIES')
            }
            url = 'https://api.sec-api.io/mapping/exchange/nasdaq?token=YOUR_API_KEY'
            response = requests.get(url,params = params,retry = 30)
            response.raise_for_status()
            data = response.json()
        except requests.exceptions.RequestException as e:
            logger.exception('There are an error while extracting data from API!')
            raise
        result.extend(data)
        total += len(data)
    date = pendulum.now(tz='Aisa/Ho_Chi_Minh').strftime("%Y_%m_%d")
    path = f'/usr/local/data/raw/companies/raw_companies_{date}.json'
    with open(path,'w',encoding = 'utf-8') as file:
        json.dump(result,file,indent=2)
    logging.info(f"Extracting {total} successffuly!")
