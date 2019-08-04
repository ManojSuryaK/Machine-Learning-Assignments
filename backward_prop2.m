function [w1,w2,w3]=backward_prop2(x,a2,a3,y,t,w1,w2,w3,eta)
x=[1;x];
m=length(t);
e=y-t;
del4=e;
w3=w3-(eta*del4*a3');
%dphi3=a3.*(1-a3);
dphi3=1-(a3.*a3);
del3=(w3'*del4).*dphi3;
w2=w2-(eta*(del3(2:length(del3)))*a2');
%dphi2=a2.*(1-a2);
dphi2=1-(a2.*a2);
del2=(w2'*del3(2:length(del3))).*dphi2;
w1=w1-(eta*(del2(2:length(del2)))*x');
end