Part1. Data Preprocessing Overview
The preprocessing transforms raw mobility data into a grid-based time series by dividing the study area (MSA) into 1 km × 1 km grid cells, mapping mobility points to these grids using spatial joins, and aggregating the data into 20-minute time intervals for spatiotemporal analysis.

This process is implemented using Python 3.10.13. Key packages include numpy, pandas, time, datetime, glob, os, geopandas, shapely.geometry (Point, Polygon), math, tqdm, warnings, logging, geopy.distance, and etc.

Part2. Scripts Summary
##  1.ipynb
This script converts raw mobility data into a grid-based time series for spatiotemporal analysis. Key steps include:
(1) Grid Creation: The create_grid_within_square function divides the study area (e.g., an MSA) into uniform 1 km × 1 km grid cells. Each grid cell is stored as a polygon in a GeoDataFrame with a unique grid_id.
(2) Data Mapping: The process_csv_file function: Converts timestamps into months, days, and 20-minute intervals (20min_id). Maps each mobility record to its corresponding grid cell using spatial joins. Outputs a dataset with matched grid IDs for each time interval.
(3) Output: The processed data is saved as a grid-based time series, with each record corresponding to a specific time interval, grid cell.

## 2.ipynb
This script processes the grid-based time series generated in 1.ipynb to produce grid-level summaries. Key steps include:
(1) Data Loading: Reads the processed mobility data into a DataFrame (df) containing columns for time, grid IDs, and records.
(2) Time Filtering: Filters the data to include only records within a specified date range (e.g., February 3–16, 2020).
(3) Data Aggregation: Groups the filtered data by month, day, 20min_id, and grid_id. Counts the number of occurrences for each unique combination and stores the result in the num column.
(4) Output: Saves datasets for further analysis.

## Running the code for a specific MSA
To reproduce the results for a specific MSA, you will need:
(1) Shapefile: The shapefile of the MSA, including its boundary.
(2) Mobility data: A dataset containing mobility records with timestamps, longitude, and latitude.

## Running the code for other MSAs
To run the code for other MSAs:
(1) Update the MSA name in both 1.ipynb and 2.ipynb.
(2) Execute the scripts in sequence (1.ipynb first, followed by 2.ipynb).
(3) The outputs will be saved in a folder containing all the necessary data for analysis.



