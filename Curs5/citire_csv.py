import csv

with open("profesori_original.csv", "r") as freader:
    csv_reader = csv.DictReader(freader)
    print(csv_reader)
    for row in csv_reader:
        print(row)

new_human_dict = {
    'idprofesor': '6', 
    'nume': 'Gheorghescu', 
    'prenume': 'Gica', 
    'adresa': '1', 
    'data_nasterii': '1964-02-01', 
    'grad': 'I'
    }

with open('profesori.csv', "a") as fwriter:
    fieldnames = ['idprofesor', 'nume', 'prenume', 'adresa', 'data_masterii', 'grad']
    csv_writer = csv.DictWriter(fwriter)
    csv_writer.writerow(new_human_dict)
