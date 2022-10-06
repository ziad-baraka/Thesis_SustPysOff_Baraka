function [R, P, overAllGrowth] = calculateGrowth( growData, sustData, lengths)
R=[];
P=[];
overAllGrowth = 0;
for i=1:length(lengths)-1
    ind1 = lengths(i)+1;
    ind2 = lengths(i+1);
    currGrow = growData(ind1:ind2);
    currGrow(isinf(currGrow)|isnan(currGrow))=0;
    currGrowSum = sum(currGrow);
        [r, p] = corr(sustData(ind1:ind2),currGrow,'Type','Spearman');
%         if r<0.2 && r>-0.2
            R = [R; r]; %#ok<AGROW>
            P = [P; p]; %#ok<AGROW>
            if currGrowSum>0
                overAllGrowth = overAllGrowth+1;
            end
%         end
end
end