function [data] = read(fileName)
    %READ read data from file
    fileID = fopen(fileName,'r');
    formatSpec = '%f';
    sizeA = [1 Inf];
    data = fscanf(fileID,formatSpec,sizeA);
    fclose(fileID);
end

