function [] = PlotData(sustDataSME, ebitDataSME,sustDataLow, ebitDataLow,sustDataHigh, ebitDataHigh )
%% Data Plotting
figure
if isempty(sustDataSME)
    sustDataSME=0;
    ebitDataSME=0;
end
subplot(3,1,1)
scatter(sustDataSME, ebitDataSME,'Marker', '.','MarkerEdgeColor','k')
hold on
xlim([0 100])
% line(xlim(), [0,0], 'LineWidth', 1, 'Color', 'k');
ylim([-0.1, max(ebitDataSME)+0.1])
grid on
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('Environmental emissions vs Operating profit for SMEs','fontweight','bold')

subplot(3,1,2)
scatter(sustDataLow, ebitDataLow,'Marker', '.','MarkerEdgeColor','k')
hold on
line(xlim(), [0,0], 'LineWidth', 1, 'Color', 'k');
% ylim([-2e8, max(ebitDataLow)+1e8])
grid on
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn lower than the median','fontweight','bold')

subplot(3,1,3)
scatter(sustDataHigh, ebitDataHigh,'Marker', '.','MarkerEdgeColor','k')
hold on
line(xlim(), [0,0], 'LineWidth', 2, 'Color', 'k');
grid on
% ylim([-1.5e10, max(ebitDataHigh)+1e10])
xlabel('Environmental emissions score')
ylabel('Operating Profit in euros')
title('for Companies that earn Higher than the median','fontweight','bold')
end

