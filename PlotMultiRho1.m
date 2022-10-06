subplot(3,2,1)
ind1=1140;
ind2=1157;
plotWithTime( Results10y, ind1, ind2,1)
title('\rho > 0.5  ')
lgd=legend('Return on Profit','GHG emissions');
lgd.Location='southeast';

subplot(3,2,3)
ind1=918;
ind2=932;
plotWithTime( Results10y, ind1, ind2,1)
title('0.5 > \rho > 0.2  ')

subplot(3,2,5)
ind1=1044;
ind2=1058;
plotWithTime( Results10y, ind1, ind2,1)

title('0<\rho < 0.2')


subplot(3,2,2)
ind1 = 848;
ind2 = 860;
plotWithTime( Results10y, ind1, ind2,1)
title('\rho < -0.5 ')

subplot(3,2,4)
ind1=740;
ind2=751;
plotWithTime( Results10y, ind1, ind2,1)
title('-0.2 > \rho > -0.5  ')

subplot(3,2,6)
ind1=472;
ind2=485;

plotWithTime( Results10y, ind1, ind2,1)

title('0 > \rho > -0.2  ')
