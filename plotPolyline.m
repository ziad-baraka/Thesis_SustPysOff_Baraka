function [x,y] = plotPolyline(sustData,ebitData, n)
p = polyfit(sustData,ebitData,n);
x = linspace(0,100,10000);
y = polyval(p,x);
end