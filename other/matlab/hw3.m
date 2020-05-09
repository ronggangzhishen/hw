format long

m = 10;
x = [.25 .5 .75 1 1.25 1.5 1.75 2 2.25 2.5];
y = [1.284 1.648 2.117 2.718 3.427 2.798 3.534 4.456 5.465 5.894];

ss = sum(sin(x).^2);
sc = sum(sin(x).*cos(x));
cc = sum(cos(x).^2);
sy = sum(sin(x).*y);
cy = sum(cos(x).*y);
%使Q对a，b的偏导为0，有[ss sc;sc cc][a b]=[sy;cy]
a = (sy*cc-cy*sc)/(ss*cc-sc^2)
b = (ss*cy-sc*sy)/(ss*cc-sc^2)
q = sum((a*sin(x)+b*cos(x)-y).^2)/m

tx=linspace(0,3,10);
ty=a*sin(tx)+b*cos(tx);
hold on
plot(x,y)
plot(tx,ty)