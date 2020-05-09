format long;
f=@(x,y) -x^2*y^2;
y0=3;
e=zeros(1,4);
y1p5=3/(1+1.5^3);
fprintf('四阶runge_kutta,k=2,对x=1.5处计算误差\n');
for i=1:4
    if i == 1
        m=15;
    else
        m=2*m;
    end
    [x,y]=runge_kutta4(f,0,1.5,m,y0);
    e(i)=abs(y(m+1)-y1p5);
    if i<2
        fprintf('h=%.4f\terr=%.15f\n',1.5/m,e(i));
    else
        fprintf('h=%.4f\terr=%.15f\tok=%.15f\n',1.5/m,e(i),log(e(i-1)/e(i))/log(2));
    end
end
fprintf('四阶隐式adams,k=2,对x=1.5处计算误差(超出左端点的y（i）值使用左端点代替)\n');
for i=1:4
    if i == 1
        m=15;
    else
        m=2*m;
    end
    [x,y]=adams4(f,0,1.5,m,y0);
    e(i)=abs(y(m+1)-y1p5);
    if i<2
        fprintf('h=%.4f\terr=%.15f\n',1.5/m,e(i));
    else
        fprintf('h=%.4f\terr=%.15f\tok=%.15f\n',1.5/m,e(i),log(e(i-1)/e(i))/log(2));
    end
end