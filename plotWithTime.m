function [] = plotWithTime( Results, ind1, ind2,type )

switch type
    case 1
        yyaxis left
        plot(Results.timeDataHigh(ind1:ind2),Results.ebitDataHigh(ind1:ind2),'k')

        ylabel 'Return on Profit'
        hold on
        yyaxis right

        plot(Results.timeDataHigh(ind1:ind2),Results.sustDataHigh(ind1:ind2),'k--');
        ylabel 'GHG emissions score'
        xlabel 'Year'
    case 2
        yyaxis left
        plot(Results.timeDataLow(ind1:ind2),Results.ebitDataLow(ind1:ind2),'k')

        ylabel 'Return on Profit'
        hold on
        yyaxis right

        plot(Results.timeDataLow(ind1:ind2),Results.sustDataLow(ind1:ind2),'k--');
        ylabel 'GHG emissions score'
        xlabel 'Year'
    otherwise
end
end

