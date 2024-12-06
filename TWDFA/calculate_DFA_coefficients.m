% This is a code file that is used to estimate the temporal scaling exponent 
% (also called DFA coefficient) for the mean fluctuations over time scales


% calculate_DFA_coefficients() is a main function. Its execution requires 
% inputting the complete path and name of the CSV file recording the results 
% of the mean fluctuations versus the corresponding time scales for all grid 
% cells, and the complete path and name of the CSV file for saving the results
% (containing the estimated DFA coefficient and the goodness of fit for each grid).
function calculate_DFA_coefficients()

    clear
    close all
    
    % Enter the path and name of the input CSV file
    filepath = input('Enter the CSV file path and name: ', 's');
    Fs = readtable(filepath);     % Create table data from text files and spreadsheets
    Fs = table2array(Fs);     % Convert table data to a numerical matrix
    
    % Set key parameters for linear estimation
    [p,~] = size(Fs);     % The number of rows in the numerical matrix
    x = log(Fs(1,1:70));     % Logarithmic transformation of time scales
    y = log(Fs(2:p,1:70));     % Logarithmic transformation of the mean fluctuations
    m = length(x);     % Sample size of independent variable
    n = length(y(:,1));     % Sample size of dependent variable
    x1 = [ones(m,1),x'];     % Add a constant vector
    Result = [];     % Establish an empty set
    
    % Perform linear fitting and estimate slope coefficient and goodness of fit
    for i = 1 : n
        y1 = y(i,:)';
        b1 = (x1' * x1) \ (x1' * y1);
        R2 = (abs(b1' * x1' * y1) - m * mean(y1) ^ 2) / (abs(y1' * y1) - m * mean(y1) ^ 2);
        Result = [Result; b1(2) R2];
    end
    
    % Enter the path and name of the CSV file for output
    output = input('Enter the CSV file path and name for save: ', 's');
    % Write the estimated results of slope coefficient and goodness of fit into 
    % the output CSV file
    csvwrite(output,Result);

end