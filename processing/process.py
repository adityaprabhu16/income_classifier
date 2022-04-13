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

def convert_income(val):
    temp = val.strip().strip(".")
    if temp == "<=50K":
        return 0
    else:
        return 1

def process(filename):
    data = pd.read_csv(f"processing\{filename}.csv", encoding="utf-8", header=None)

    data.columns = columns
    
    for col in columns:
        if col == "income":

            income = data[col].apply(convert_income)

            data = data.drop([col], axis=1)
            data = pd.concat([data, income], axis=1)
            
            continue

        if col in col_map:
            data[col] = data[col].apply(convert, name=col)
            one_hot = pd.get_dummies(data[col], prefix="", prefix_sep="")

            # new_columns = []

            # for i in range(0, len(col_map[col])):
            #     new_columns.append(col + "_" + str(float(i)))

            new_columns = list(col_map[col])
            one_hot = one_hot.reindex(columns=new_columns, fill_value=0)

            data = pd.concat([data, one_hot], axis=1)
            data = data.drop([col], axis=1)

        else:
            data[col] = (data[col] - data[col].min()) / (data[col].max() - data[col].min())

    data.to_csv(f"processing\{filename}_cleaned.csv", index=False)



# total 105 feature columns and one output column

set_up()
process("test_data")
process("training_data")