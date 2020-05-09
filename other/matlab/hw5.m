format long
f = @(x) x^3/3-x;
df = @(x) x^2-1;
g = @(x) x-f(x)/df(x);

x=zeros(4,255);
x(1,1)=.1;
x(2,1)=.2;
x(3,1)=.9;
x(4,1)=9;
for k=1:4
for i=1:255
    x(k,i+1)=g(x(k,i));
    if abs(x(k,i+1)-x(k,i))<1.0E-8
        break;
    end
end
fprintf('x0=%f\tx*=%.15f\ti=%d\n',x(k,1),x(k,i+1),i);
end
fprintf('¡üNewton 2½×\n¡ýÏÒ½Ø 1.618½×\n');
x=zeros(4,255);
x(1,1)=-.1;x(1,2)=.1;
x(2,1)=-.2;x(2,2)=.2;
x(3,1)=-2;x(3,2)=.9;
x(4,1)=.9;x(4,2)=9;
for k=1:4
for i=2:255
    x(k,i+1)=x(k,i)-f(x(k,i))*(x(k,i)-x(k,i-1))/(f(x(k,i))-f(x(k,i-1)));
    if abs(x(k,i+1)-x(k,i))<1.0E-8
        break;
    end
end
fprintf('x0=%f\tx1=%f\tx*=%.15f\ti=%d\n',x(k,1),x(k,2),x(k,i+1),i-1);
end
    
