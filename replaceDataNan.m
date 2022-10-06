function currData = replaceDataNan( currData, nanInd )

for i=1:length(nanInd)
    ind = nanInd(i);
    if ind==1 || ind==2
        currData(ind)=0;
    else
        if currData(ind-1)~=currData(ind-2);
            currData(ind)=currData(ind-1);
        else
            currData(ind)=0;
        end
    end
end
end

