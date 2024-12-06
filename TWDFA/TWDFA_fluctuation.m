% This is a code file that is used to estimate the mean fluctuation over 
% time scales based on the temporally weighted detrended fluctuation analysis 
% (TWDFA) for a grid-based time series data


% TWDFA_fluctuation() is a main function to estimate the mean fluctuation over 
% various time scales for time series of grid cells that is derived
% from an input csv file with its path and name. The result will be saved as 
% a CSV file with a custom path and name.
function TWDFA_fluctuation()
    clear
    close all
    
    h = 1;  % Define the order of detrending polynomial
    
    % Enter the path and name of the georeferenced time series file
    filepath = input('Enter the CSV file path and name: ', 's');   
    
    C = readFile(filepath);     % Read the input csv file

    m = length(C(:,2));     % The number of grid cells
    n = length(C(1,:)) - 1;     % The length of time series
    
    C2 = cumulativeSum(C, m, n);    % Run the function cumulativeSum()
    C3 = (h + 2) : 72;     % Define the range of time scales
    result = meanFluctuation(C2, C3, m, n);     % run the function meanFluctuation()
    
    % Enter the path and name of the output CSV file
    output = input('Enter the CSV file path and name for save: ', 's'); 
    
    % Write the calculation result of the mean fluctuation into the output CSV file
    csvwrite(output,result); 
end


% readFile() is a function that is used to read georeferenced time series 
% stored in a CSV file and convert them into a numerical matrix. The input
% variable should be a complete path with name of a CSV file.
function data = readFile(filepath)

    data = readtable(filepath);     % Create table data from text files and spreadsheets
    data = table2array(data);     % Convert table data to a numerical matrix

end


% cumulativeSum() is a function to creat profiles for georeferenced time series.
% The input variables include georeferenced time series, the number of grid
% cells, and the length of time series
function result = cumulativeSum(data, m, n)

    C = data;     % Store the input variable
    C2 = [];     % Establish an empty set

    for p = 1 : m     % Loop through each grid cell
        Cp = C(p,2:n+1);     % Obtain the time series for a grid cell
        Mp = mean(Cp);     % Calculate the mean of this time series
        C1 = [];     % Establish an empty set
        for k = 1 : n     % Loop through this time series
            c = sum(Cp(1:k)-Mp);     % Subtract the mean and sum up
            C1 = [C1,c];     % Store the profile of a grid cell
        end
        C2 = [C2;C1];     % Store all profiles of grid cells
    end
    
    result = C2;     % Return the profiles to the variable 'result'

end


% meanFluctuation() is a function to calculate the mean fluctuation after
% detrending based on the temporally weighted detrended fluctuation
% analysis.The input variables include profile data, time scale range,the number 
% of grid cells, and the length of time series
function result = meanFluctuation(cumulativeResult, scaleRange, m, n)

    % Store the input variable
    C2 = cumulativeResult;
    C3 = scaleRange;
    
    Result = [];     % Establish an empty set
    Result = [Result;C3];     % Store the time scale range as the first row 

    for p = 1 : m     % Loop through all profiles
        Cp = C2(p,:);     % Obtain the profile for a grid cell
        temp = [];     % Establish an empty set
        for s = C3     % Loop through all time scales
            count = floor(n/s);     % The number of nonoverlapping local windows
            tot = count * s;     % The maximum range for forward detrending 
            sta = n - count * s + 1;     % The maximum range for backward detrending
            s1 = 0;
            s2 = 0;
            x = 1 : s;      % The scale range of local window
            w = zeros(s,s);      % Initialize the temporal weight matrix
            % Perform the forward temporally weighted detrending and
            % calculate the variance
            for i = 1 : s : tot
                a = i + s - 1;
                y = Cp(i:a);
                yp1 = [];
                for r1 = 1 : s
                    for r2 = 1 : s
                        w(r2,r2) = (1 - ((r1 - r2) / s) ^2) ^ 2;
                    end
                    x1 = [ones(s,1),x'];
                    y1 = y';
                    b1 = (x1'* w * x1) \ (x1' * w * y1);
                    f1 = b1(1) + b1(2) * x(r1);
                    yp1 = [yp1;f1];
                end
                e1 = y1 - yp1;
                re1 = sumsqr(e1) / s;
                s1 = s1 + re1;
            end
            % Perform the backward temporally weighted detrending and
            % calculate the variance
            for j = n : -s : sta
                b = j - s + 1;
                y = Cp(b:j);
                yp1 = [];
                for r1 = 1 : s
                    for r2 = 1 : s
                        w(r2,r2) = (1 - ((r1 - r2) / s) ^2) ^ 2;
                    end
                    x1 = [ones(s,1),x'];
                    y1 = y';
                    b1 = (x1'* w * x1) \ (x1' * w * y1);
                    f1 = b1(1) + b1(2) * x(r1);
                    yp1 = [yp1;f1];
                end            
                e1 = y1 - yp1;
                re1 = sumsqr(e1) / s;
                s2 = s2 + re1;
            end
            fs = sqrt((s1 + s2) / (2 * count));      % Obtain the mean fluctuaion
            temp = [temp, fs];      % Store the mean fluctuation
        end
        % Store the mean fluctuations of all grid cells across time scales
        Result = [Result;temp];     
    end
    result = Result;     % Return all mean fluctuations to the variable 'result'
end