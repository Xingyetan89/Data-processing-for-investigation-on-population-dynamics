# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np

r_text = pd.read_table('F:\\GRMD PhD\\Research Project\\POP Time series analysis and DFA\\Preprocessing Data\\Data Process\\2018_04_29\\TecentData_SZ.txt', sep=',')
content = pd.DataFrame(r_text)
time_A = content['time'].unique()
loc_gp = content.groupby(['lat', 'lon'])
loc_name = loc_gp.size().index

time_B = ['lat', 'lon']
for k in range(int(len(time_A))):
    time_B.append(time_A[k])
result = pd.DataFrame(columns=time_B)

print(len(loc_name))
for h in range(int(len(loc_name))):
    lat_n = loc_name[h][0]
    lon_n = loc_name[h][1]
    result = result.append(pd.DataFrame({'lat': [lat_n], 'lon': [lon_n]}), ignore_index=True)
    print(h)

print(len(content))
for i in range(int(len(content))):
    time = content.iloc[i, 1]
    lat = content.iloc[i, 2]
    lon = content.iloc[i, 3]
    count = content.iloc[i, 4]
    j = result[(result['lat'] == lat) & (result['lon'] == lon)].index.tolist()
    result.loc[j, time] = count
    print(i)

result.to_csv('TecentData_SZ1.txt', mode='a', index=False)
