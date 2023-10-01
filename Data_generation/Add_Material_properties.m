%%
%Starting to save the material properties
parentFolders = {
    'moodafunc\Data\Semiconductor\Switches',
    'moodafunc\Data\DCCap\PPFilm',
    'moodafunc\Data\EMI\Caps\Cy',
    };

folderNames = {
    {'1200V', '750V'},
    {'1200V', '1000V', '700V', '500V'},
    {'1000V300VAC'},
    };

chips = {};
caps = {};
cycaps = {};

%Iterate over the parent folders
for i = 1:length(parentFolders)
    parentFolder = parentFolders{i};
    subFolderNames = folderNames{i};

    %Iterate over the subfolders
    for j = 1:length(subFolderNames)
        subFolderName = subFolderNames{j};
        folderPath = fullfile(parentFolder, subFolderName);

        %Get the list of files in the folder
        files = dir(fullfile(folderPath, '*.mat'));

        %Iterate over the files
        for k = 1:length(files)
            %Get the file name and path
            fileName = files(k).name;
            filePath = fullfile(folderPath, fileName);

            %Load the data from the file
            data = load(filePath);

            %Process and analyze the data as needed

            %Save the data
            saveName = fileName;  % Add a prefix to the file name
            %savePath = fullfile(parentFolder, saveName);
            %save(savePath, 'data');

            %Update the appropriate cell array
            if i == 1
                chips{end+1} = saveName;
            elseif i == 2
                caps{end+1} = saveName;
            elseif i == 3
                cycaps{end+1} = saveName;
            end
        end
    end
end
%%
%Save all Properties in Cell
chip_properties = {};
%Get all the properties
for i = 1:length(chips)
    load(chips{i});
    Chip_name = chip.Info.Type;
    %Udc = chip.Info.Udc;
    RdsTjFac = interp1(chip.Switch.Tj,chip.Switch.RdsTjFac,175);
    RdsFw = double(interp1(chip.Switch.IdsFw,chip.Switch.RdsFw,100));%P
    RdsRv = double(interp1(chip.Switch.IdsRv,chip.Switch.RdsRv,-100));
    Eon = interp1(chip.SwEnergy.Dpt.Ids,chip.SwEnergy.Dpt.Eon,100);
    Eoff = interp1(chip.SwEnergy.Dpt.Ids,chip.SwEnergy.Dpt.Eoff,100);
    kdvdtEswOn = interp1(chip.SwEnergy.Dpt.dudtOff,chip.SwEnergy.Dpt.kdvdtEswOn,20);
    kdvdtEswOff = interp1(chip.SwEnergy.Dpt.dudtOff,chip.SwEnergy.Dpt.kdvdtEswOff,20);
    kUdcEswOn = interp1(chip.SwEnergy.Dpt.Udc,chip.SwEnergy.Dpt.kUdcEswOn,700);
    kUdcEswOff = interp1(chip.SwEnergy.Dpt.Udc,chip.SwEnergy.Dpt.kUdcEswOff,700);
    Coss = interp1(chip.Cap.Uds,chip.Cap.Coss,200);
    QgTyp = chip.SwEnergy.QgTyp;
    RgTyp = chip.Info.RgTyp;

    chip_properties{i, 1} = Chip_name;
    %chip_properties{i, 2} = Udc;
    chip_properties{i, 2} = RdsTjFac; %1
    chip_properties{i, 3} = RdsFw;
    chip_properties{i, 4} = RdsRv;
    chip_properties{i, 5} = Eon;
    chip_properties{i, 6} = Eoff;
    chip_properties{i, 7} = kdvdtEswOn;
    chip_properties{i, 8} = kdvdtEswOff;
    chip_properties{i, 9} = kUdcEswOn;
    chip_properties{i, 10} = kUdcEswOff;
    chip_properties{i, 11} = Coss; %10
    chip_properties{i, 12} = QgTyp; %new
    chip_properties{i, 13} = RgTyp; %new
end

cycaps_properties = {};
%Get all the properties
for i = 1:length(cycaps)
    load(cycaps{i});
    CyCap_name = cap.Info.Type;
    %UdcMax = cap.Info.UdcMax;
    ESLres = cap.Electric.ESLres;
    ESRTyp = cap.Electric.ESRTyp;
    C = cap.Electric.C;
    fRes = cap.Electric.fRes;
    m = cap.Geo.m;
    V = cap.Geo.V;
    Z = cap.Electric.Z(1);  %new
    ImaxRef = cap.Info.ImaxRef; %new
    cost = cap.Info.cost; %new
    IRmsMax = cap.Electric.IrmsMax(1); %new
    ESR = cap.Electric.ESR(1); %new

    cycaps_properties{i, 1} = CyCap_name;
    %cycaps_properties{i, 2} = UdcMax;
    cycaps_properties{i, 2} = ESLres;
    cycaps_properties{i, 3} = ESRTyp;
    cycaps_properties{i, 4} = C;
    cycaps_properties{i, 5} = fRes;
    cycaps_properties{i, 6} = m;
    cycaps_properties{i, 7} = V;
    cycaps_properties{i, 8} = Z;
    cycaps_properties{i, 9} = ImaxRef;
    cycaps_properties{i, 10} = cost;
    cycaps_properties{i, 11} = IRmsMax;
    cycaps_properties{i, 12} = ESR;

end
clear cap

% cxcaps_properties = {};
% %Get all the properties
% for i = 1:length(cxcaps)
%     load(cxcaps{i});
%     CxCap_name = cap.Info.Type;
%     %UdcMax = cap.Info.UdcMax;
%     ESLres = cap.Electric.ESLres;
%     ESRTyp = cap.Electric.ESRTyp;
%     C = cap.Electric.C;
%     fRes = cap.Electric.fRes;
%     m = cap.Geo.m;
%     V = cap.Geo.V;
%
%     cxcaps_properties{i, 1} = CxCap_name;
%     %cxcaps_properties{i, 2} = UdcMax;
%     cxcaps_properties{i, 2} = ESLres;
%     cxcaps_properties{i, 3} = ESRTyp;
%     cxcaps_properties{i, 4} = C;
%     cxcaps_properties{i, 5} = fRes;
%     cxcaps_properties{i, 6} = m;
%     cxcaps_properties{i, 7} = V;
% end
% clear cap

caps_properties = {};
%Get all the properties
for i = 1:length(caps)
    load(caps{i});
    Cap_name = cap.Info.Type;
    %UdcMax = cap.Info.UdcMax;
    ESLres = cap.Electric.ESLres;
    ESRTyp = cap.Electric.ESRTyp;
    C = cap.Electric.C;
    fRes = cap.Electric.fRes;
    m = cap.Geo.m;
    V = cap.Geo.V;
    Z = cap.Electric.Z(1);  %new
    ImaxRef = cap.Info.ImaxRef; %new
    cost = cap.Info.cost; %new
    IRmsMax = cap.Electric.IrmsMax(1); %new
    ESR = cap.Electric.ESR(1); %new


    caps_properties{i, 1} = Cap_name;
    %caps_properties{i, 2} = UdcMax;
    caps_properties{i, 2} = ESLres;
    caps_properties{i, 3} = ESRTyp;
    caps_properties{i, 4} = C;
    caps_properties{i, 5} = fRes;
    caps_properties{i, 6} = m;
    caps_properties{i, 7} = V;
    caps_properties{i, 8} = Z;
    caps_properties{i, 9} = ImaxRef;
    caps_properties{i, 10} = cost;
    caps_properties{i, 11} = IRmsMax;
    caps_properties{i, 12} = ESR;
end
clear cap

save("ANN_Training\Material_Property\Properties_extra.mat", "chip_properties","caps_properties","cycaps_properties")
