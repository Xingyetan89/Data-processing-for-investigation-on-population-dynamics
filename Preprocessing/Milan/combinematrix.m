% This is a code file that is used to combine the georeferenced time series 
% with a 10-minute interval into a new series with a 20-minute interval.


% Manually import 10-day georeferenced time series data, with the first column 
% set as grid ID and saved as variable ITS. Then merge every two columns except 
% for the column of grid ID.
ITS = I(:,1);
for i = 1 : 720
    T = I(:,i*2) + I(:,i*2+1);
    ITS = [ITS,T];
end