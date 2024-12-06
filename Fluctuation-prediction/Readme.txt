The folder of 'Fluctuation-prediction' contains a sample data file and a script file.

Sample data:

The file of 'Avg_Fs.csv' shows a truncated observation sample of mean population fluctuation (in logarithmic form) in Greater Boston, corresponding to distances of 28.5 kilometers and 31.5 kilometers (in the first column) from the city center, with time scales ranging from 1 hour to 24 hours in increments of 20 minutes (the values 3-72 in the first row).

Script:

By processing the script 'Fs_estimation.m', we can predict the mean fluctuation (in logarithmic form) based on the given spatiotemporal scales and parameters as well as compare the prediction with the observation. For example, if we input the sample data 'Avg_Fs.csv' and parameters (b = 0.085, a1 = 1.605, d1 = -0.508, Const = 0.342, please refer to Extended Data Table 2), the output results will present the observation (the first column) and prediction (the second column) values, corresponding to distances from the city center (the third column) and time scales (the fourth column).

Note: The input and output file names must include the extension (e.g., *.csv), otherwise an error will be reported.