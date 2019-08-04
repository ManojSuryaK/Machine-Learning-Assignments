function w= rosenblatt(x,t)
[m,n]=size(x);
w= ones(1,n);
lent=length(t);
eta=0.1;
i=1;
y=zeros(1,lent);
if m~=lent
    display('dimensions not compatible');
end
error=calc_rosenblatt_error(w,x,t);
while(error~=0)
while(i<5)
    w=w+(eta*x(i,:)*t(i));
    i=i+1;
end
error=calc_rosenblatt_error(w,x,t);
disp(error);
end


for j=1:4
y(j)=threshold(x(j,:)'*w);
end
disp(y);
disp(w);
end