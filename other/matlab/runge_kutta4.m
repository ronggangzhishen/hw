function [x,y] = runge_kutta4(f,a,b,m,y0)
%ËÄ½×
x=linspace(a,b,m+1);
y=zeros(1,m+1);
y(1)=y0;
h=(b-a)/m;
for i=1:m
    k1=h*f(x(i),y(i));
    k2=h*f(x(i)+h/2,y(i)+k1/2);
    k3=h*f(x(i)+h/2,y(i)+k2/2);
    k4=h*f(x(i)+h,y(i)+k3);
    %fprintf('k1=%f k2=%f k3=%f k4=%f\n',k1,k2,k3,k4);
    y(i+1)=y(i)+(k1+2*k2+2*k3+k4)/6;
end

end

