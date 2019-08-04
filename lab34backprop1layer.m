% bias+1  sigmoid ---- bias+1 sigmoid------1(output)no sqashing
x=0:(1/49):1;
lenx=length(x);
t=x;
%unit function
 for i=1:length(x)
     if x(i)<0
         t(i)=0;
     else 
         t(i)=1;
     end
 end
% mod function
% for i=1:length(x)
%     if x(i)<=0
%         t(i)=x(i);
%     else 
%         t(i)=(1-x(i));
%     end
% end
        
w1=randn(2,2);
w2=randn(3,1);
wn1(1,:)=1;
w2(1,1)=1;
%x=0:(1/9):1;
%t=sin(2*pi*x);
y=zeros(lenx,1);
x=x';
%lenx=length(x);
t=t';
eta=0.0001;
iterations=0;
error=calc_mse(y,t);
disp(error);
Cost=zeros(100000,1);
while(error>0.001)
for i=1:lenx
    [y(i),arecv1]=forward_prop1(x(i),w1,w2);
   [w1,w2]= backward_prop1(x(i),arecv1,y(i),t(i),w1,w2,eta);   
   
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
w1(1,:)=1;
w2(1,1)=1;
%scatter(x,t,'r');
%hold on;
for i=1:lenx
    [y(i),arecv1]=forward_prop1(x(i),w1,w2);
    
end


