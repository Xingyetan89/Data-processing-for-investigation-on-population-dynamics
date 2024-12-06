% This is a code file that is used to arrange the raw data into the format of
% georeferenced time series for Milan.


% Open the raw data saved as a txt file and read the data as a numerical matrix, 
% replacing null values with 0. 
filepath = input('Enter the TXT file path and name: ', 's');
fileID = fopen(filepath, 'r');
data = textscan(fileID, '%f %f %f %f %f %f %f %f', 'Delimiter', '\t');
fclose(fileID);
da4 = cell2mat(data);
da4(isnan(da4)) = 0;

% Extract grid ID and time ID and initialize georeferenced time series
A = unique(da4(:,1));
T = unique(da4(:,2));
m = length(A);
n = length(T);
ZO = zeros(m,n);
TS = [T';ZO];
B = [0;A];
TS = [B,TS];
[x,y] = size(da4);

% Assign values to the georeferenced time series according to the corresponding 
% grid ID and time ID from the raw data
for i = 1 : x
    id = da4(i,1);
    time = da4(i,2);
    value = da4(i,8);
    row = find(TS(:,1)==id);
    col = find(TS(1,:)==time);
    TS(row,col) = value;
end

% Write the result into the output CSV file
output = input('Enter the CSV file path and name for save: ', 's');
csvwrite(output,TS);


