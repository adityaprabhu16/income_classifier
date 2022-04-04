import pandas as pd
import os

col_map = {}
columns = []

def set_up():
    
    names = open(r"C:\Users\Tanush\Documents\income_classifier\processing\names.txt", "r")

    for line in names:
        split_words = line.split(":")
        key = split_words[0]
        values = split_words[1].strip().replace(".", "")

        columns.append(key)

        temp = {}

        if "continuous" not in values:
            for i, val in enumerate(values.split(",")):
                temp[val.strip()] = i
        
            col_map[key] = temp

    columns.append("income")


def convert(val, name):
    val = val.strip()
    name = name.strip()

    if val in col_map[name]:
        return col_map[name][val]

    return None

def remove_trailing_spaces(val):
    return val.strip()

def process(filename):
    data = pd.read_csv(f"processing\{filename}.csv", encoding="utf-8")
    data.columns = columns
    
    for col in columns:
        if col == "income":
            data[col] = data[col].apply(remove_trailing_spaces)
            continue

        if col in col_map:
            data[col] = data[col].apply(convert, name=col)
            one_hot = pd.get_dummies(data[col], prefix=col)

            data = pd.concat([data, one_hot], axis=1)
            data = data.drop([col], axis=1)

        else:
            data[col] = (data[col] - data[col].min()) / (data[col].max() - data[col].min())

    data.to_csv(f"processing\{filename}_cleaned.csv", index=False)


set_up()
process("test_data")
process("training_data")