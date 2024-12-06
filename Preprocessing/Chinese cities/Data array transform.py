# -*- coding: utf-8 -*-

# import Pandas and NumPy library for data manipulation and numerical computation
import pandas as pd
import numpy as np


# Read the data file into a Pandas DataFrame
r_text = pd.read_table('F:\\GRMD PhD\\Research Project\\POP Time series analysis and DFA\\Preprocessing Data\\Data Process\\2018_04_29\\TecentData_SZ.txt', sep=',')
content = pd.DataFrame(r_text)

# Extracts all unique values from time and geographical coordinates
time_A = content['time'].unique()
loc_gp = content.groupby(['lat', 'lon'])
loc_name = loc_gp.size().index

# Establish the header of the result data framework. It will be arranged according to the order of latitude, longitude,
# and time spots
time_B = ['lat', 'lon']
for k in range(int(len(time_A))):
    time_B.append(time_A[k])
result = pd.DataFrame(columns=time_B)

# Iterates over all unique latitude and longitude(lat, lon) combinations (loc_name) and appends them as rows to
# the result DataFrame with their lat and lon values.
print(len(loc_name))
for h in range(int(len(loc_name))):
    lat_n = loc_name[h][0]
    lon_n = loc_name[h][1]
    result = result.append(pd.DataFrame({'lat': [lat_n], 'lon': [lon_n]}), ignore_index=True)
    print(h)

# Iterates over each row in data and retrieve time, lat, lon, and count from the current row. Finds the row index (j)
# in result where the lat and lon match. Update the result DataFrame, setting the value of the row corresponding to the
# matched lat and lon and the column corresponding to time to count.
print(len(content))
for i in range(int(len(content))):
    time = content.iloc[i, 1]
    lat = content.iloc[i, 2]
    lon = content.iloc[i, 3]
    count = content.iloc[i, 4]
    j = result[(result['lat'] == lat) & (result['lon'] == lon)].index.tolist()
    result.loc[j, time] = count
    print(i)

# Writes the result DataFrame to a txt file
result.to_csv('TecentData_SZ1.txt', mode='a', index=False)
