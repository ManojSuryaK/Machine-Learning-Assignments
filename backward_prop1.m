function [w1,w2]=backward_prop1(x,a1,y,t,w1,w2,eta)
m=length(t);
e=t-y;
del2=e;
w2=w2+(eta*del2*a1);
temp1=(a1.*(1-a1));
temp1=temp1(2:length(temp1));
temp2=w2(2:length(w2));
del1=(temp1*((temp2'*del2)));
w1=w1+((eta*del1*x));
% del2=e;
%     del1=difftanh(a1).*(del2*w2(2:end,:)');
%                   
%     Jw2=[1 a1]'*del2;
%     Jw1=[1 x]'*del1;
%     %Weight Update
%    
%     w2=w2+eta*Jw2;
%     w1=w1+eta*Jw1;
end