# -*- coding: utf-8 -*-

import pandas as pd

r_text = pd.read_table('F:\\GRMD PhD\\Research Project\\POP Time series analysis and DFA\\Preprocessing Data\\Process netfish\\Shanghai_1_1_5km\\Total_fishnet_count_SH_10days_1_1_5km.csv', sep=',')
content = pd.DataFrame(r_text)
df = content.loc[content.iloc[:, 1:].sum(axis=1) > 0, :]
df.to_csv('total_fishnet_count_SH_10days_0_1_1_5km.txt', mode='a', index=False)
