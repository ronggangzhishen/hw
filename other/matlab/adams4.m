function [x,y] = adams4(f,a,b,m,y0)
%四阶,对于初值在区间左端点之外的，都取为左端点
x=linspace(a,b,m+1);
y=zeros(1,m+1);
y(1)=y0;
h=(b-a)/m;
%runge_kutta起步
for i=1:m
    k1=h*f(x(i),y(i));
    k2=h*f(x(i)+h/2,y(i)+k1/2);
    k3=h*f(x(i)+h/2,y(i)+k2/2);
    k4=h*f(x(i)+h,y(i)+k3);
    %fprintf('k1=%f k2=%f k3=%f k4=%f\n',k1,k2,k3,k4);
    y(i+1)=y(i)+(k1+2*k2+2*k3+k4)/6;
end
% % 显
% for i=1:m
%     k1=h*f(x(i),y(i));
%     k2=k1;k3=k1;k4=k1;
%     if i-1 > 0
%     k2=h*f(x(i-1),y(i-1)); end
%     if i-2 > 0
%     k3=h*f(x(i-2),y(i-2)); end
%     if i-3 > 0
%     k4=h*f(x(i-3),y(i-3)); end
%     y(i+1)=y(i)+(55*k1-59*k2+37*k3-9*k4)/24;
% end
% 隐
for i=3:m %避免超出左端点
    
    k2=h*f(x(i),y(i));
    k3=k2;k4=k2;k5=k2;
    if i-1 > 0
    k3=h*f(x(i-1),y(i-1)); end
    if i-2 > 0
    k4=h*f(x(i-2),y(i-2)); end
    if i-3 > 0
    k5=h*f(x(i-3),y(i-3)); end
    yb=y(i)+(55*k2-59*k3+37*k4-9*k5)/24;
    k1=h*f(x(i+1),yb);
    y(i+1)=y(i)+(9*k1+19*k2-5*k3+k4)/24;
end
end