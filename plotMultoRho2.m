subplot(3,2,1)
ind1=1262;
ind2=1271;
plotWithTime( Results10y, ind1, ind2,1)
title('\rho > 0.5  ')
lgd=legend('Return on Profit','GHG emissions');
lgd.Location='southwest';

subplot(3,2,3)
ind1=486;
ind2=502;
plotWithTime( Results10y, ind1, ind2,1)
title('0.5 > \rho > 0.2  ')

subplot(3,2,5)
ind1=1063;
ind2=1069;
plotWithTime( Results10y, ind1, ind2,1)

title('0<\rho < 0.2')


subplot(3,2,2)
ind1 = 689;
ind2 = 701;
plotWithTime( Results10y, ind1, ind2,1)
title('\rho < -0.5 ')

subplot(3,2,4)
ind1=349;
ind2=364;
plotWithTime( Results10y, ind1, ind2,1)
title('-0.2 > \rho > -0.5  ')

subplot(3,2,6)
ind1=1040;
ind2=1058;

plotWithTime( Results10y, ind1, ind2,1)

title('0 > \rho > -0.2  ')
