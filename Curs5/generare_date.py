import requests
from pprint import pprint
import time
import csv

URL = "https//randomuser.me/api/"

for i in range(6, 16):

    response = requests.get(URL)
    pprint(response.json())

    human_json = response.json()
    first_name = human_json ['results'][0]['name']['first']
    last_name = human_json ['results'][0]['name']['last']
    birthdate = human_json ['results'][0]['dob']['date']

    new_human_dict = {
        'idprofesor': 1, 
        'nume': last_name, 
        'prenume': first_name, 
        'adresa': '1', 
        'data_nasterii': birthdate, 
        'grad': 'I'
    }
    