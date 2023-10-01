%Concatenate Property Matrix with Input and Output
%topology = '2LVL';
topology = '3LVL_ANPC/NPC';
%topology = '3LVL_TT';

if strcmp(topology,'2LVL')
    input_2LVL_properties = input;
    output_2LVL_properties = output;
    for i = 1:length(input_2LVL_properties)
        label = input_2LVL_properties(i, 9);
        input_2LVL_properties(i, 9:8+size(Properties_2LVSI, 2)) = cell2mat(Properties_2LVSI(label, :));
        output_2LVL_properties(i, 4:3+size(Properties_2LVSI, 2)) = cell2mat(Properties_2LVSI(label, :));
    end
elseif strcmp(topology,'3LVL_ANPC/NPC')
    input_3LVL_properties = input;
    output_3LVL_properties = output;
    for i = 1:length(input_3LVL_properties)
        label = input_3LVL_properties(i, 11);
        input_3LVL_properties(i, 11:10+size(Properties_3LVL, 2)) = cell2mat(Properties_3LVL(label, :));
        output_3LVL_properties(i, 4:3+size(Properties_3LVL, 2)) = cell2mat(Properties_3LVL(label, :));
    end    
elseif strcmp(topology,'3LVL_TT')
input_3LVL_TT_properties = input;
output_3LVL_TT_properties = output;
for i = 1:length(input_3LVL_TT_properties)
    label = input_2LVL_properties(i, 10);
    input_3LVL_TT_properties(i, 10:9+size(Properties_3LVL_TT, 2)) = cell2mat(Properties_3LVL_TT(label, :));
    output_3LVL_TT_properties(i, 4:3+size(Properties_3LVL_TT, 2)) = cell2mat(Properties_3LVL_TT(label, :));
end   
end