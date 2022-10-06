function [R, P] = correlatVars( ebitData, sustData, lengths )
R=[];
P=[];
for i=1:length(lengths)-1
    ind1 = lengths(i)+1;
    ind2 = lengths(i+1);
try
    [r, p] = corr(sustData(ind1:ind2-1),ebitData(ind1+1:ind2),'Type','Spearman');
    if r>0.5% && r>0.2
    R = [R; r]; %#ok<AGROW>
    P = [P; p]; %#ok<AGROW>
    if length(R)==9
        disp(ind1)
        disp(ind2)
    end
    end
catch
end
end
end

