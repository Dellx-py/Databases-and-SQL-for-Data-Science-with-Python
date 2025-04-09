import requests
from pprint import pprint
import time
import csv

URL = "https://randomuser.me/api/"
human_list = []

for i in range(16, 26):

    response = requests.get(URL)
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
    human_list.append(new_human_dict)

    print('Rezultat', first_name, last_name, birthdate)
    time.sleep(2)


with open('profesori.csv', "a") as fwriter:
    fieldnames = ['idprofesor', 'nume', 'prenume', 'adresa', 'data_masterii', 'grad']
    csv_writer = csv.DictWriter(fwriter, fieldnames)
    for new_human_dict in human_list:
        csv_writer.writerow(new_human_dict)

