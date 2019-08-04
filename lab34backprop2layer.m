% bias+1  sigmoid ---- bias+1 sigmoid------bias+1 sigmoid---------1(output)no sqashing
function nnaprox
        
w1=randn(2,2);
w2=randn(2,3);
w3=randn(1,3);
w1(:,1)=1;
w2(:,1)=1;
w3(:,1)=1;
x=0:0.1:10;
lenx=length(x);
t=0.6*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);
y=zeros(lenx,1);
x=x';
%lenx=length(x);
t=t';
eta=0.25;
iterations=0;
error=calc_mse(y,t);
disp(error);
Cost=zeros(100000,1);
while(error>0.08)
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
        scatter(x,t,'r');
        hold on;
        plot(x,y);
        return;
    end
end
     
iterations=iterations+1;
disp(iterations);
end
w1(:,1)=1;
w2(:,1)=1;
w3(:,1)=1;
scatter(x,t,'r');
hold on;
for i=1:lenx
    [y(i),arecv2,arecv3]=forward_prop2(x(i),w1,w2,w3);
    
end
plot(x,y);


