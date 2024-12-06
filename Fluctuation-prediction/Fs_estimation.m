% This is a code file that is used to predict the mean fluctuation based on 
% distances r from main city center, temporal scales s and input parameters,
% and list the observation and prediction corresponding to the distances and 
% time scales for comparison.


% Fs_estimation() is a main function. Its execution requires inputting the 
% complete path and name of the CSV file recording observation data, four key 
% parameters for prediction, and the complete path and name of the CSV file 
% used for saving the results.
function Fs_estimation()
    clear
    close all
    
    % Enter the path and name of the CSV file recording observation data
    filepath = input('Enter the CSV file path and name: ', 's');
    C = readFile(filepath);     % Read the input csv file
    
    b = input('Enter the b value: ');     % Input the value of parameter b
    a1 = input('Enter the a1 value: ');     % Input the value of parameter a1
    d1 = input('Enter the d1 value: ');     % Input the value of parameter d1
    
    % Input the value of the constant parameter
    con = input('Enter the Const value: '); 
    
    % Arrange the observed values by distances and time scales
    R1 = orderObservation(C);
    % Make the prediction according to distances and time scales
    R2 = fsEstimate(C, b, a1, d1, con);
    % Store the results of observation and prediction
    Results = [R1, R2];
    
    % Enter the path and name of the CSV file for output
    output = input('Enter the CSV file path and name for save: ', 's');     
    % Write the observation and prediction results into the output CSV file
    csvwrite(output,Results); 
end


% readFile() is a function that is used to read a CSV file and convert the
% data within it into a numerical matrix. The input variable should be a 
% complete path with name of a CSV file.
function data = readFile(filepath)

    data = readtable(filepath);     % Create table data from text files and spreadsheets
    data = table2array(data);     % Convert table data to a numerical matrix

end


% orderObservation() is a function to rearrange the observed values in a column 
% vector according to distances and time scales. The input variable should be a
% numerical matrix.
function result = orderObservation(data)
    
    C = data;     % Store the input variable
    k = size(C);     % Obtain the number of rows and columns in the numerical matrix
    AFS = C(2:k(1),2:k(2));     % Obtain the observed values
    % Obtain the number of rows and columns in the numerical matrix of the observed values
    m = size(AFS);
    R1 = [];     % Establish an empty set
    
    % Loop through the observed values of each row corresponding to each distance and
    % transpose row vectors into column vectors
    for i = 1 : m(1)  
        x1 = AFS(i,:);
        x2 = x1';
        R1 = [R1; x2];
    end
    result = R1;     % Return the rearranged observation data to the variable 'result'
    
end


% fsEstimate() is a function to make the prediction based on four key parameters,
% distances, and time scales. The input variable should be a numerical matrix with
% the information of distances and time scales.
function result = fsEstimate(data, b, a1, d1, con)

    C = data;     % Store the input variable
    k = size(C);     % The number of rows and columns in the numerical matrix
    R2 = [];     % Establish an empty set
    r = C(2:k(1),1);     % Obtain the information of distances
    ts = C(1,2:k(2));     % Obtain the information of time scales
    n = length(r);     % The number of distances
    p = length(ts);     % The number of time scales
    
    % Calculate the prediction results based on four key parameters, distances, 
    % and time scales.
    for i = 1 : n
        for j = 1 : p
            fs = d1 * log(r(i)) + a1 * log(ts(j)) - b *  log(r(i)) * log(ts(j)) + con;
            R3 = [fs, r(i), ts(j)];
            R2 = [R2; R3];
        end
    end
    result = R2;     % Return the prediction to the variable 'result'
    
end
