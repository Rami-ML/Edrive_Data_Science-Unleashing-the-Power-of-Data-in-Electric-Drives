%%
%2LVL
%Create Cell dependent on the Combination Matrices
%load("ANN_Training\Material_Property\Properties_extra.mat")
%combination_matrix  = load('combinations_2LVSI.mat').combination_matrix;
% num_properties = 3;  % Number of property cells, including chip_properties, caps_properties, cycaps_properties, and cxcaps_properties
% 
% Properties_2LVSI = cell(length(combination_matrix), size(chip_properties, 2) ...
%      + size(caps_properties, 2) + size(cycaps_properties, 2) - num_properties);
% 
% for i = 1:length(combination_matrix)
%     chip_name = combination_matrix{i, 1};
%     cap_name = combination_matrix{i, 2};
%     cycap_name = combination_matrix{i, 3};
%     
%     % Find matching rows in chip_properties
%     chip_indices = find(ismember(chip_properties(:, 1), chip_name));
%     
%     if ~isempty(chip_indices)
%         % Copy chip_properties columns 2:end to Properties_2LVL
%         Properties_2LVSI(i, 1:size(chip_properties, 2)-1) = chip_properties(chip_indices, 2:end);
%     end
%     
%     % Find matching rows in caps_properties
%     cap_indices = find(ismember(caps_properties(:, 1), cap_name));
%     
%     if ~isempty(cap_indices)
%         % Determine the starting column index for caps_properties in Properties_2LVL
%         col_start = size(chip_properties, 2);
%         
%         % Copy caps_properties columns 2:end to Properties_2LVL
%         Properties_2LVSI(i, col_start:col_start+size(caps_properties, 2)-2) = caps_properties(cap_indices, 2:end);
%     end
%     
%     % Find matching rows in cycaps_properties
%     cycap_indices = find(ismember(cycaps_properties(:, 1), cycap_name));
%     
%     if ~isempty(cycap_indices)
%         % Determine the starting column index for cycaps_properties in Properties_2LVL
%         col_start = size(chip_properties, 2) + size(caps_properties, 2) - 1;
%         
%         % Copy cycaps_properties columns 2:end to Properties_2LVL
%         Properties_2LVSI(i, col_start:col_start+size(cycaps_properties, 2)-2) = cycaps_properties(cycap_indices, 2:end);
%     end
% end
% save("ANN_Training\Material_Property\2LVSI_Material_Cell_extra.mat", "Properties_2LVSI")
%%
%%
% %3LVL_ANPC + 3LVL_NPC
% %Create Cell dependent on the Combination Matrices
% load("ANN_Training\Material_Property\Properties_extra.mat")
% combination_matrix  = load('combinations_3L_ANPC+NPC.mat').combination_matrix;
% num_properties = 3;  % Number of property cells, including chip_properties, caps_properties, cycaps_properties
% 
% Properties_3LVL = cell(length(combination_matrix), size(chip_properties, 2) ...
%     + size(caps_properties, 2) + size(cycaps_properties, 2) - num_properties);
% 
% for i = 1:length(combination_matrix)
%     chip_name = combination_matrix{i, 1};
%     cap_name = combination_matrix{i, 2};
%     cycap_name = combination_matrix{i, 3};
%     
%     % Find matching rows in chip_properties
%     chip_indices = find(ismember(chip_properties(:, 1), chip_name));
%     
%     if ~isempty(chip_indices)
%         % Copy chip_properties columns 2:end to Properties_2LVL
%         Properties_3LVL(i, 1:size(chip_properties, 2)-1) = chip_properties(chip_indices, 2:end);
%     end
%     
%     % Find matching rows in caps_properties
%     cap_indices = find(ismember(caps_properties(:, 1), cap_name));
%     
%     if ~isempty(cap_indices)
%         % Determine the starting column index for caps_properties in Properties_2LVL
%         col_start = size(chip_properties, 2);
%         
%         % Copy caps_properties columns 2:end to Properties_2LVL
%         Properties_3LVL(i, col_start:col_start+size(caps_properties, 2)-2) = caps_properties(cap_indices, 2:end);
%     end
%     
%     % Find matching rows in cycaps_properties
%     cycap_indices = find(ismember(cycaps_properties(:, 1), cycap_name));
%     
%     if ~isempty(cycap_indices)
%         % Determine the starting column index for cycaps_properties in Properties_2LVL
%         col_start = size(chip_properties, 2) + size(caps_properties, 2) - 1;
%         
%         % Copy cycaps_properties columns 2:end to Properties_2LVL
%         Properties_3LVL(i, col_start:col_start+size(cycaps_properties, 2)-2) = cycaps_properties(cycap_indices, 2:end);
%     end   
% end
% save("ANN_Training\Material_Property\3LVL_Material_Cell_extra.mat", "Properties_3LVL")
% %
%%
%3L-TT
%Create Cell dependent on the Combination Matrices
load("ANN_Training\Material_Property\Properties.mat")
combination_matrix  = load('combinations_3L_TT.mat').combination_matrix;
num_properties = 4;  % Number of property cells, including chip_properties, caps_properties, cycaps_properties

Properties_3LVL_TT = cell(length(combination_matrix), 2*size(chip_properties, 2) ...
    + size(caps_properties, 2) + size(cycaps_properties, 2) - num_properties);

for i = 1:length(combination_matrix)
    chip_name_1 = combination_matrix{i, 1};
    chip_name_2 = combination_matrix{i, 2};
    cap_name = combination_matrix{i, 3};
    cycap_name = combination_matrix{i, 4};
    
    % Find matching rows in chip_properties
    chip_indices_1 = find(ismember(chip_properties(:, 1), chip_name_1));
    
    if ~isempty(chip_indices_1)
        % Copy chip_properties columns 2:end to Properties_2LVL
        Properties_3LVL_TT(i, 1:size(chip_properties, 2)-1) = chip_properties(chip_indices_1, 2:end);
    end

    % Find matching rows in chip_properties
    chip_indices_2 = find(ismember(chip_properties(:, 1), chip_name_2));
    
    if ~isempty(chip_indices_2)
        % Determine the starting column index for caps_properties in Properties_2LVL
        col_start = size(chip_properties, 2);

        % Copy chip_properties columns 2:end to Properties_2LVL
        % Copy caps_properties columns 2:end to Properties_2LVL
        Properties_3LVL_TT(i, col_start:col_start+size(chip_properties, 2)-2) = chip_properties(chip_indices_2, 2:end);
    end
    
    % Find matching rows in caps_properties
    cap_indices = find(ismember(caps_properties(:, 1), cap_name));
    
    if ~isempty(cap_indices)
        % Determine the starting column index for caps_properties in Properties_2LVL
        col_start = 2 * size(chip_properties, 2) - 1;
        
        % Copy caps_properties columns 2:end to Properties_2LVL
        Properties_3LVL_TT(i, col_start:col_start+size(caps_properties, 2)-2) = caps_properties(cap_indices, 2:end);
    end
    
    % Find matching rows in cycaps_properties
    cycap_indices = find(ismember(cycaps_properties(:, 1), cycap_name));
    
    if ~isempty(cycap_indices)
        % Determine the starting column index for cycaps_properties in Properties_2LVL
        col_start = 2 * size(chip_properties, 2) + size(caps_properties, 2) - 2;
        
        % Copy cycaps_properties columns 2:end to Properties_2LVL
        Properties_3LVL_TT(i, col_start:col_start+size(cycaps_properties, 2)-2) = cycaps_properties(cycap_indices, 2:end);
    end   
end
save("ANN_Training\Material_Property\3LVL_TT__Material_Cell.mat", "Properties_3LVL_TT")
%