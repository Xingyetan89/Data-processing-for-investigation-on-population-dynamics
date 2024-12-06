Note: We haven't performed the reproducible run on the platform of CodeOcean as we are unable to share the original dataset, but these scripts can be well performed on PC.

Raw data description:

The original data for Milan were obtained from an open dataset created by Barlacchi et al.(2015) based on “Telecom Italia Big Data Challenge”. These data have already been gridded and well organized into check-in records every 10 minutes for each grid cell on a daily basis. Thus, the data preprocessing needs to:

1. Reorganize the raw data into grid-based time series, and
2. Merge time series at 20 minute intervals

Execution:

1) By processing the script 'dataprocessing.m', the original data can be arranged to grid-based time series.

2) By manually importing 10-day data and operating the script 'combinematrix.py', the data can be merged to grid-based time series with a 20-minute interval.