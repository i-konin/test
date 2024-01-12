import json
import csv


file = open('analytics_example.json', encoding='utf-8')
data = json.load(file)

# формирование csv
columns = data[0].get('dimension_names')+data[0].get('metrics_names')
writer = csv.writer(open('ozon_api.csv', 'w+'))

writer.writerow(columns) # записываем имена колонок первый строкой

for unit in data:
    row =[]
    for dim in unit.get('dimensions'): # проходим по ключам группировки и собираем их id
        row.append(dim.get('id'))
    row += unit.get('metrics') # добавляем к строке лист с метриками
    writer.writerow(row) # дописываем строку в csv
    