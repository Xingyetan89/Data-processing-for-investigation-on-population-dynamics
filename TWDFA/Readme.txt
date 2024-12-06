The folder of 'TWDFA' contains two data samples and two scripts for performing the temporally weighted detrended fluctuation analysis

Data samples:

1. The file of 'sample time series.csv' shows a simple example of grid-based time series format, where each row corresponds to a time series for a grid, and the first column denotes grid ID (e.g., 1152 and 1153), while the other columns record time series values.

2. The file of 'Fs_results.csv' exhibits the estimated mean fluctuations for the two sample grid cells in 'sample time series.csv'. The second and third rows present the  
estimation results for the Grid 1152 and 1153 respectively, corresponding to the measuring time scales listed in the first row.

Scripts:

1. By processing the script 'TWDFA_fluctuation.m', we can estimate the mean fluctuations over time scales by using the temporally weighted detrended fluctuation analysis (TWDFA) for a grid-based time series data such as 'sample time series.csv'. The output result will be represented in the same format as shown in 'Fs_results.csv'.

2. By processing the script 'calculate_DFA_coefficients.m', we can estimate the temporal scaling exponent (also called DFA coefficient) for each grid cell based on its mean fluctuations over time scales (e.g., 'Fs_results.csv') estimated by performing the script 'TWDFA_fluctuation.m' for original grid-based time series (e.g., 'sample time series.csv'). Each row in the output result will save the estimated temporal scaling exponent (the first column) and the goodness of fit (the second column) for each grid.

Note: The input and output file names must include the extension (e.g., *.csv), otherwise an error will be reported.