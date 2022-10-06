function [ ] = exportTocsv( sustData, ebitData, filename )
if isempty(filename)
    filename='Result.csv';
end
outTable = table(sustData, ebitData);
writetable(outTable, filename)
end

