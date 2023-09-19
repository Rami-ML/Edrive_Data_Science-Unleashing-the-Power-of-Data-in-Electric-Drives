%topology = 'input_2LVSI.csv';
%topology = 'input_3L_ANPC.csv';
 topology = 'input_3L_NPC.csv';
% topology = 'input_3L_TT.csv';

% Specify the directory where you want to save the CSV file
outputDirectory = 'Matlab_generated_csv\07.09.2023';

% Specify the CSV file name with a .csv extension
outputFileName = fullfile(outputDirectory, topology);

% Create a table from your numeric matrix
if strcmp(topology, 'input_2LVSI.csv')
    data_table = array2table(input, 'VariableNames', {'fsw', 'dudt', 'Cap', 'CapCy', 'raemi', 'laemi', 'nchip', 'Achip', 'label'});
else
    data_table = array2table(input, 'VariableNames', {'fsw', 'dudt', 'Cap', 'CapCy', 'raemi', 'laemi', 'nchip1', 'nchip2', 'nchip3', 'Achip', 'label'});
end

% Save the table as a CSV file with tab delimiter and decimal separator set to a period
writetable(data_table, outputFileName, 'Delimiter', ';', 'WriteVariableNames', true, 'Encoding', 'UTF-8');




