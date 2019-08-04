n=-10:45;
xwith=[-2 0 0;-2 1 0; 0.5 0.5 0;0.5 1 0;0.5 2 0;0.5 -4 1;0.5 -2 1;2 -2 1;2 -4 1;4 0 1;25 -8 1;36 -6 1;20 -4 1];
xwithout=[-2 0 0;-2 1 0; 0.5 0.5 0;0.5 1 0;0.5 2 0;0.5 -4 1;0.5 -2 1;2 -2 1;2 -4 1;4 0 1];
Xwith=[xwith(:,1) xwith(:,2)];
twith=xwith(:,3);
Xwithout=[xwithout(:,1) xwithout(:,2)];
twithout=xwithout(:,3);
w_with=pinv(Xwith'*Xwith)*Xwith'*twith;
w_without=pinv(Xwithout'*Xwithout)*Xwithout'*twithout;
plotData(Xwithout,twithout);
title('without outliers');

ywithout=(w_without(1)*n)+w_without(2);
hold all;
plot(n,ywithout,'r');

plotData(Xwith,twith);
title('with outliers');
ywith=(w_with(1)*n)+w_with(2);
hold all;
plot(n,ywith,'r');

