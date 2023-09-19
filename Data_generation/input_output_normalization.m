% %Input concatenate algorithm and scaling (min-max)
%Normalizing with properties
matFilePath_input = load('Data_generated_with_properties\07.09.2023\3L_NPC_properties_32_25_synthetic.mat', 'input_3LVL_properties');
matFilePath_output = load('Data_generated_with_properties\07.09.2023\3L_NPC_properties_32_25_synthetic.mat', 'output_3LVL_properties');

input = matFilePath_input.input_3LVL_properties;
output = matFilePath_output.output_3LVL_properties;

%Make negative values positive (only works when all constraint are passed)
output(:,1) = abs(output(:,1));
output(:,2) = abs(output(:,2));

%Remove Udc from columns
%del_input = [8,19,26,33];
%del_output = [4, 15, 22, 29];

% Create a logical index to select the columns to keep
%column_indices_input = true(1, size(input, 2));
%column_indices_input(del_input) = false;

%column_indices_output = true(1, size(output, 2));
%column_indices_output(del_output) = false;

% Delete the specified columns
%input = input(:, column_indices_input);
%output = output(:, column_indices_output);

%Scale data
input_scaled = normalize(input(:, 1:size(input,2)), 'range', [0 1]);
output_scaled = normalize(output(:, 1:size(output,2)), 'range', [0 1]);

% Reverse scaling for output_scaled
min_values_input = min(input(:, 1:size(input,2)));
max_values_input = max(input(:, 1:size(input,2)));
min_values_output = min(output(:, 1:size(output,2)));
max_values_output = max(output(:, 1:size(output,2)));

output_renormalized = output_scaled(:, 1:size(output,2)) .* (max_values_output -min_values_output) + min_values_output;
%output_renormalized = round(output_renormalized, 3);

save(['ANN_Training\Data_Scaled\3LVL\07.09.2023\3L_NPC_scaled_32_25_synthetic'], "input_scaled", ...
    "output_scaled", "output", "input", "min_values_input", "max_values_input", "min_values_output", "max_values_output")
%%
% %Normalizing with properties
% matFilePath_input = load('Data_generated_with_properties\6000_data_with_properties_3L_ANPC.mat', 'input_3LVL_properties');
% matFilePath_output = load('Data_generated_with_properties\6000_data_with_properties_3L_ANPC.mat', 'output_3LVL_properties');
% 
% %Get sample number of string 
% sample = 8000;
% 
% input = matFilePath_input.input_3LVL_properties;
% output = matFilePath_output.output_3LVL_properties;
% 
% %Make negative values positive (only works when all constraint are passed)
% output(:,1) = abs(output(:,1));
% output(:,2) = abs(output(:,2));
% 
% %Remove Udc from columns
% %del_input = [8,19,26,33];
% %del_output = [4, 15, 22, 29];
% 
% % Create a logical index to select the columns to keep
% %column_indices_input = true(1, size(input, 2));
% %column_indices_input(del_input) = false;
% 
% %column_indices_output = true(1, size(output, 2));
% %column_indices_output(del_output) = false;
% 
% % Delete the specified columns
% %input = input(:, column_indices_input);
% %output = output(:, column_indices_output);
% 
% %Scale data
% input_scaled = normalize(input(:, 1:size(input,2)), 'range', [0 1]);
% output_scaled = normalize(output(:, 1:size(output,2)), 'range', [0 1]);
% 
% % Reverse scaling for output_scaled
% min_values_input = min(input(:, 1:size(input,2)));
% max_values_input = max(input(:, 1:size(input,2)));
% min_values_output = min(output(:, 1:size(output,2)));
% max_values_output = max(output(:, 1:size(output,2)));
% 
% output_renormalized = output_scaled(:, 1:size(output,2)) .* (max_values_output -min_values_output) + min_values_output;
% %output_renormalized = round(output_renormalized, 3);
% 
% save(['ANN_Training\Data_Scaled\3LVL\' num2str(sample) '_scaled_3L_ANPC_properties_data'], "input_scaled", ...
%     "output_scaled", "output", "input", "min_values_input", "max_values_input", "min_values_output", "max_values_output")