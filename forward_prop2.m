function y=forward_prop2(x,W1,W2,W3)
% x=[1;x];
% z2=w1*x;
% a2=tanh(z2);
% a2=[1;a2];
% z3=w2*a2;
% a3=tanh(z3);
% a3=[1;a3];
% z4=w3*a3;
% y=z4;
 A1=[1 x]*W1;
    y1=tanh(A1);
    A2=[1 y1]*W2;
    y2=tanh(A2);
    A3=[1 y2]*W3;
    y=A3;
end