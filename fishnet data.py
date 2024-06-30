# -*- coding: utf-8 -*-

import pandas as pd

r_text = pd.read_table('F:\\GRMD PhD\\Research Project\\POP Time series analysis and DFA\\Preprocessing Data\\Data Transform\\TecentData_SH_point\\Excel\\new_1_1_5km\\SH_20180429.csv', sep=',')
content = pd.DataFrame(r_text)
groups = content.groupby('FID_SH', as_index=False)
group_sum = groups.sum()
results = pd.DataFrame(group_sum)
print(results.columns)
results.to_csv('SH_20180429.txt', mode='a', index=False)

