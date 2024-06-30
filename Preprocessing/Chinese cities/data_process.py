# -*- coding: utf-8 -*-

import pandas as pd
import os

def data_preprocess(file_path):
    f = open(dir_file_path)
    test_str = f.read()
    f.close()
    data = test_str.replace('{', '').replace('}', '').replace(' ', ',')
    data1 = data.split('":"')
    time1 = data1[1]
    time2 = time1.replace('"', '')
    time3 = time2.split(',')
    date = time3[0]
    time = time3[1]

    data2 = data1[2]
    data3 = data2.replace('{', '').replace('}', '').replace(' ', '').replace(':', '').replace('"', '')
    data4 = data3.split(',')
    tempBJ = []
    tempSH = []
    tempGZ = []
    tempSZ = []
    for i in range(int(len(data4)/3)):
        lat = data4[0 + i * 3]
        lon = data4[1 + i * 3]
        count = data4[2 + i * 3]
        if(3932 < int(lat) < 4114 and 11536 < int(lon) < 11753):
            tempBJ.append([date, time, int(lat)/100, int(lon)/100, count])
        if(3067 < int(lat) < 3192 and 12081 < int(lon) < 12209):
            tempSH.append([date, time, int(lat)/100, int(lon)/100, count])
        if(2254 < int(lat) < 2399 and 11289 < int(lon) < 11408):
            tempGZ.append([date, time, int(lat)/100, int(lon)/100, count])
        if(2242 < int(lat) < 2289 and 11370 < int(lon) < 11466):
            tempSZ.append([date, time, int(lat)/100, int(lon)/100, count])
    result1 = pd.DataFrame(tempBJ)
    result2 = pd.DataFrame(tempSH)
    result3 = pd.DataFrame(tempGZ)
    result4 = pd.DataFrame(tempSZ)
    result1.columns = ['date', 'time', 'lat', 'lon', 'count']
    result2.columns = ['date', 'time', 'lat', 'lon', 'count']
    result3.columns = ['date', 'time', 'lat', 'lon', 'count']
    result4.columns = ['date', 'time', 'lat', 'lon', 'count']
    if c == 1:
        result1.to_csv('TecentData_BJ.txt', mode='a', index=False)
        result2.to_csv('TecentData_SH.txt', mode='a', index=False)
        result3.to_csv('TecentData_GZ.txt', mode='a', index=False)
        result4.to_csv('TecentData_SZ.txt', mode='a', index=False)
    else:
        result1.to_csv('TecentData_BJ.txt', mode='a', header=False, index=False)
        result2.to_csv('TecentData_SH.txt', mode='a', header=False, index=False)
        result3.to_csv('TecentData_GZ.txt', mode='a', header=False, index=False)
        result4.to_csv('TecentData_SZ.txt', mode='a', header=False, index=False)

if __name__ == '__main__':
    c = 0
    for root, dirs, files in os.walk(r'F:/GRMD PhD/Research Project/POP Time series analysis and DFA/Tecent_Data/2018-04-29'):
        for file in files:
            c = c + 1
            dir_file_path = os.path.join(root, file)
            data_preprocess(dir_file_path)
            print(c)

