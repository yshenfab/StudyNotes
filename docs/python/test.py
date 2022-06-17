from operator import itemgetter

rows = [{'name': 'Yang', 'uid': 1001}, {'name': 'James', 'uid': 1003}]

rows_by_name = sorted(rows, key=itemgetter('name'))
rows_by_uid = sorted(rows, key=itemgetter('uid'))
