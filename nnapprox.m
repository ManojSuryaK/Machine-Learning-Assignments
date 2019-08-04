% bias+1  sigmoid ---- bias+1 sigmoid------bias+1 sigmoid---------1(output)no sqashing
function [y,w1,w2,w3]=nnapprox(x,etaf,e_threshold)        
w1=randn(20,2);
w2=randn(10,21);
w3=zeros(1,11);
w1(:,1)=1;
w2(:,1)=1;
w3(:,1)=1;
%x=0:0.1:10;
lenx=length(x);
%t=0.6*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);
y=zeros(lenx,1);
x=x';
%lenx=length(x);
t=x;
eta=etaf;
iterations=0;
error=calc_mse(y,t);
disp(error);
Cost=zeros(100000,1);
while(error>e_threshold)
for i=1:lenx
    [y(i),arecv2,arecv3]=forward_prop2(x(i),w1,w2,w3);
   [w1,w2,w3]= backward_prop2(x(i),arecv2,arecv3,y(i),t(i),w1,w2,w3,eta);   
   
end
error=calc_mse(y,t);
disp(error);
Cost(iterations+1)=error;
%early stopping
if iterations >2
    if Cost(iterations)>Cost(iterations-1)
               return;
    end
end
     
iterations=iterations+1;
disp(iterations);
end
w1(:,1)=1;
w2(:,1)=1;
w3(:,1)=1;

for i=1:lenx
    [y(i),arecv2,arecv3]=forward_prop2(x(i),w1,w2,w3);
    
end

end

