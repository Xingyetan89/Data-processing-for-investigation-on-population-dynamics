Note: We haven't performed the reproducible run on the platform of CodeOcean as we are unable to share the original dataset, but these scripts can be well performed on PC.

Raw data description:

The original check-in data for Chinese cities were from Tencent's Xingyun map, organized and integrated by time spots. Accordingly, each crawled file contains all check-in records worldwide at a specific time point. Thus, the data preprocessing needs to:

1. Screen the raw data to given geographical areas,
2. Collect and reorganized data from all time spots within a given day into a single file for a study area, and
3. Transform the above data from all research time (e.g., 10 weekdays) into a grid-based time series. 

Execution:

1) By processing the script 'data_process.py', the original check-in data can be screened to given geographical areas (e.g., Beijing, Shanghai, Guangzhou, and Shenzhen) on a given date (e.g., April 29, 2018).

2) Then, by operating the script 'Data array transform.py', the screened data (for a single area on a given date) can be converted to grid-based time series.