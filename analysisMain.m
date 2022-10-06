function Results =analysisMain( NoParticipation_years, file )
%% Initialization
% In this section the data is being loaded, as well as, necessary vectors
% for calculation later
DataTable   = readtable(file);
Results = struct();
Results.companies   = {};
Results.companiesHigh   = {};
Results.companiesLow   = {'l'};
Results.companiesSME   = {'l'};

Results.ebitData    = [];
Results.sustData    = [];

Results.ebitDataHigh    = [];
Results.sustDataHigh    = [];
Results.timeDataHigh    = [];
Results.growDataHigh    = [];

Results.ebitDataLow     = [];
Results.sustDataLow     = [];
Results.timeDataLow     = [];
Results.growDataLow     = [];

Results.ebitDataSME     = [];
Results.sustDataSME     = [];
Results.timeDataSME     = [];

Results.lengthsHigh     = 0;
Results.lengthsLow      = 0;
Results.lengthsSME      = 0;


Results.companiesNan    = {};
Results.ebitDataN    = [];
Results.companiesNo = length(DataTable.isin)/22;
Results.ebitLimit = 0.1011;%2.2149e8;
%% Data Filtiration
% Filtering the Results.companies that hasn't been participating in Results.sustainable
% activities for at least 10 years
for i=1:22:length(DataTable.year)-21
    currEbit = DataTable.ebit(i:i+20)./DataTable.income_rev(i:i+20);
    currEbit2 = DataTable.ebit(i:i+20);
    currSust = DataTable.TRESGENERS(i:i+20);
    currEmp  = DataTable.emp(i:i+20);
    currEbt  = DataTable.ebt(i:i+20);
    currTime = DataTable.year(i:i+20);
    ebitNan = [find(isnan(currEbit));find(isinf(currEbit))];
    sustNan = [find(isnan(currSust));find(isinf(currSust))];
    if length(ebitNan)<=NoParticipation_years && length(sustNan)<=NoParticipation_years
        currEbit = replaceDataNan(currEbit, ebitNan);
        currSust = replaceDataNan(currSust, sustNan);

        Results.companies = [Results.companies; DataTable.isin{i}];
        
        if max(currEbit)>Results.ebitLimit
            for j=1:length(currEbit)
                if currSust(j)>0.1 && abs(currEbit(j))>0 && ~isinf(currEbit(j)) && abs(currEbit(j))<1
                    Results.ebitDataHigh = [Results.ebitDataHigh; currEbit(j)];   
                    Results.sustDataHigh = [Results.sustDataHigh; currSust(j)];
                    Results.timeDataHigh = [Results.timeDataHigh; currTime(j)];
                    Results.ebitData = [Results.ebitData; currEbit(j)]; %#ok<*AGROW>
                    Results.sustData = [Results.sustData; currSust(j)];
                    if j~=1
                        Results.growDataHigh = [Results.growDataHigh;...
                            (currEbit2(j)-currEbit2(j-1))/currEbit2(j-1)];
                    end
                elseif max(currEmp)<250 && max(currEbt)<50e6 && ~isinf(currEbit(j)) && abs(currEbit(j))<1 && abs(currSust(j))>0
                           Results.ebitDataSME = [Results.ebitDataSME; currEbit(j)];   
                           Results.sustDataSME = [Results.sustDataSME; currSust(j)];
                           Results.timeDataSME = [Results.timeDataSME; currTime(j)];
                           Results.ebitData = [Results.ebitData; currEbit(j)]; %#ok<*AGROW>
                           Results.sustData = [Results.sustData; currSust(j)];
                           if ~strcmp(DataTable.isin{i},Results.companiesSME{end})
                                Results.companiesSME = [Results.companiesSME; DataTable.isin{i}]; end
                end
            end
            Results.companiesHigh = [Results.companiesHigh; DataTable.isin{i}];
        elseif max(currEbit)<=Results.ebitLimit
            for j=1:length(currEbit)
                if currSust(j)>0 && abs(currEbit(j))>0  && ~isinf(currEbit(j)) && abs(currEbit(j))<1
                    if max(currEmp)<250 && max(currEbt)<50e6 && abs(currSust(j))>0
                           Results.ebitDataSME = [Results.ebitDataSME; currEbit(j)];   
                           Results.sustDataSME = [Results.sustDataSME; currSust(j)];
                           Results.timeDataSME = [Results.timeDataSME; currTime(j)];
                           Results.ebitData = [Results.ebitData; currEbit(j)]; %#ok<*AGROW>
                           Results.sustData = [Results.sustData; currSust(j)];
                           if ~strcmp(DataTable.isin{i},Results.companiesSME{end})
                                Results.companiesSME = [Results.companiesSME; DataTable.isin{i}]; end
                    else
                        Results.ebitDataLow = [Results.ebitDataLow; currEbit(j)];   
                        Results.sustDataLow = [Results.sustDataLow; currSust(j)];
                        Results.timeDataLow = [Results.timeDataLow; currTime(j)];
                        Results.ebitData = [Results.ebitData; currEbit(j)]; %#ok<*AGROW>
                        Results.sustData = [Results.sustData; currSust(j)];
                        if ~strcmp(DataTable.isin{i},Results.companiesLow{end})
                            Results.companiesLow = [Results.companiesLow; DataTable.isin{i}]; end
                        if j~=1
                            Results.growDataLow = [Results.growDataLow;...
                                (currEbit2(j)-currEbit2(j-1))/currEbit2(j-1)];
                        end
                    end
                end
            end
            if ~strcmp(DataTable.isin{i},Results.companiesLow{end}) && ~strcmp(DataTable.isin{i},Results.companiesSME{end})
                Results.companiesNan = [Results.companiesNan; DataTable.isin{i}];
                Results.ebitDataN    = [Results.ebitDataN; replaceDataNan(currEbit, ebitNan)];
            end
        else
            Results.companiesNan = [Results.companiesNan; DataTable.isin{i}];
            Results.ebitDataN    = [Results.ebitDataN; replaceDataNan(currEbit, ebitNan)];
        end
    else
        Results.companiesNan = [Results.companiesNan; DataTable.isin{i}];
        Results.ebitDataN    = [Results.ebitDataN; replaceDataNan(currEbit, ebitNan)];
    end
    Results.lengthsHigh=[Results.lengthsHigh; length(Results.ebitDataHigh)];
    Results.lengthsLow=[Results.lengthsLow; length(Results.ebitDataLow)];
    Results.lengthsSME=[Results.lengthsSME; length(Results.ebitDataSME)];
end
Results.companiesLow=Results.companiesLow(1:end-1);
Results.companiesSME=Results.companiesSME(1:end-1);

Results.lengthsHigh=unique(Results.lengthsHigh,'sorted');
Results.lengthsLow=unique(Results.lengthsLow,'sorted');
Results.lengthsSME=unique(Results.lengthsSME,'sorted');
fprintf('No of Results.companies originaly is %i \n after filtering non valid Results.companies: %i \n',Results.companiesNo, length(Results.companies));
end

