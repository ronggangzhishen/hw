 format long
% f = @(x,y) x^2+y;
% x=linspace(1,0,6);
% y=zeros(1,11);
% yb=zeros(1,11);
% y(1)=1;
% h=-.2;
%Euler
% for i=1:5
%     y(i+1)=y(i)+h*f(x(i),y(i));
% end
% disp(y);
% for j=1:5
%     yb(j+1)=y(j)+h*f(x(j),y(j));
%     y(j+1)=y(j)+h*f(x(j+1),yb(j+1));
% end
f = @(x) x*log(x)/log(3);
a=3;
for i=1:5
    a=a*3;
    b=f(a);
    fprintf('a=%d\tb=%.8d\n',a,b);
end
