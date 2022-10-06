file='DataAnalysis.csv';
NoParticipation_years = 22;
Results = analysisMain( NoParticipation_years, file );

NoParticipation_years = 11;
Results10y =  analysisMain( NoParticipation_years, file );

NoParticipation_years = 6;
Results15y =  analysisMain( NoParticipation_years, file );
%% Plotting
PlotData(Results.sustDataSME, Results.ebitDataSME,Results.sustDataLow, Results.ebitDataLow,Results.sustDataHigh, Results.ebitDataHigh )
PlotData(Results10y.sustDataSME, Results10y.ebitDataSME,Results10y.sustDataLow, Results10y.ebitDataLow,Results10y.sustDataHigh, Results10y.ebitDataHigh )
PlotData(Results15y.sustDataSME, Results15y.ebitDataSME,Results15y.sustDataLow, Results15y.ebitDataLow,Results15y.sustDataHigh, Results15y.ebitDataHigh )

%% Regression
n=2;
figure
h(1) = subplot(3,2,1);
[x,y] = plotPolyline(Results10y.sustDataHigh,Results10y.ebitDataHigh, n);
plot(x,y,'k')
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn Higher than the median (10 years)','fontweight','bold')
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on

h(2) = subplot(3,2,2);
[x,y] = plotPolyline(Results15y.sustDataHigh,Results15y.ebitDataHigh, n);
plot(x,y,'k')
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn Higher than the median (15 years)','fontweight','bold')
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on

h(3) = subplot(3,2,3);
[x,y] = plotPolyline(Results10y.sustDataLow,Results10y.ebitDataLow, n);
plot(x,y,'k')
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn Lower than the median (10 years)','fontweight','bold')
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on

h(4) = subplot(3,2,4);
[x,y] = plotPolyline(Results15y.sustDataLow,Results15y.ebitDataLow, n);
plot(x,y,'k')
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn Lower than the median (15 years)','fontweight','bold')
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on

h(5) = subplot(3,2,5); % the last (odd) axes
pos = get(h,'Position');
new = mean(cellfun(@(v)v(1),pos(1:2)));
set(h(5),'Position',[new,pos{end}(2:end)])
[x,y] = plotPolyline(Results.sustDataSME,Results.ebitDataSME, n);
plot(x,y,'k')
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for SMEs since between 2001 and 2021','fontweight','bold')
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on
%% Output to excel
% exportTocsv( sustDataSME, ebitDataSME, '' )
%% Correlation
fprintf('---------------------- \n')
[R, P] = correlatVars( Results.ebitDataHigh, Results.sustDataHigh, Results.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('All - the average correlation coefficient is: %d (P= %d)\n',mean(R),mean(P));
[R, P] = correlatVars( Results10y.ebitDataHigh, Results10y.sustDataHigh, Results10y.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('H10 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P));

[R, P] = correlatVars( Results15y.ebitDataHigh, Results15y.sustDataHigh, Results15y.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('H15 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))
%% Low profit
fprintf('---------------------- \n')
[R, P] = correlatVars( Results.ebitDataLow, Results.sustDataLow, Results.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('All - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))

[R, P] = correlatVars( Results10y.ebitDataLow, Results10y.sustDataLow, Results10y.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('L10 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))

[R, P] = correlatVars( Results15y.ebitDataLow, Results15y.sustDataLow, Results15y.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
fprintf('L15 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))
%% Correlation Growth
fprintf('---------------------- \n')
[R, P, G] = calculateGrowth( Results.growDataHigh, Results.timeDataHigh, Results.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('All - the average correlation coefficient is: %d (P= %d)\n',mean(R),mean(P));
[R, P, G] = calculateGrowth( Results10y.growDataHigh, Results10y.timeDataHigh, Results10y.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('H10 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P));

[R, P, G] = calculateGrowth( Results15y.growDataHigh, Results15y.timeDataHigh, Results15y.lengthsHigh );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('H15 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))
%% Low profit
fprintf('---------------------- \n')
[R, P, G] = calculateGrowth( Results.growDataLow, Results.sustDataLow, Results.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('All - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))

[R, P, G] = calculateGrowth( Results10y.growDataLow, Results10y.sustDataLow, Results10y.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('L10 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))

[R, P, G] = calculateGrowth( Results15y.growDataLow, Results15y.sustDataLow, Results15y.lengthsLow );
R=R(~isnan(R));
P=P(~isnan(P));
disp(length(R))
disp(G)
fprintf('L15 - the average correlation coefficient is: %d  (P= %d)\n',mean(R),mean(P))
