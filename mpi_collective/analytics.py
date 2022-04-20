import csv

path = "./txt_barrier/barrier.csv"

with open(path, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',')
    for row in spamreader:
        # print(', '.join(row))

        a = []
        for i in range(1, len(row)):
            a.append(float(row[i][:8]))
        
        print(a)
        print(f'mean = {sum(a)/len(a)}')

