import csv
import codecs
import dateparser

with codecs.open('combineddata.csv', encoding="utf8") as csvfile:
    r = csv.reader(csvfile)
    lines = list(r)
    for i in range(1, len(lines)):
        b = lines[i]
        lines[i][9] = dateparser.parse(str(b[9]))
    writer = csv.writer(codecs.open('output.csv', 'w', encoding="utf8"))
    writer.writerows(lines)

