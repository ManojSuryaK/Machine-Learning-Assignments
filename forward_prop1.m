function [y,a1]=forward_prop1(x,w1,w2)
x=[1;x];
z1=w1'*x;
a1=logsig(z1);
a1=[1;a1];
z2=w2'*a1;
y=z2;
end