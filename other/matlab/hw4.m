format long
F = cos(1) - cos(5);    %exact
fprintf('  l值\t数值积分值(T梯，Ssimpson)\t\t误差\t\t\tk=2时误差阶(与相邻项计算得到)\n');
for i=1:12
    N=2^i+1;
    h=4/(N-1);
    x=linspace(1,5,N);
    y=sin(x);
    Tn=y(1)/2+sum(y([2:N-1]))+y(N)/2;
    Tn=h*Tn;
    %Sn=y(1)+4*sum(y([2:2:N-1]))+2*sum(y([3:2:N-2]))+y(N);
    %Sn=(h/3)*Sn;
    if i ~= 1
        preeh=eh;   %last eh
    end
    eh=abs(F-Tn);   %En
    if i ~= 1
        ok=log(preeh/eh)/log(2);
        fprintf('ok=%.15f\n',ok);
    end
    fprintf('  l=%d\tTn=%.15f\teh=%.15f\t',i,Tn,eh);
end
fprintf('\n');
for i=1:12
    N=2^i+1;
    h=4/(N-1);
    x=linspace(1,5,N);
    y=sin(x);
    Sn=y(1)+4*sum(y([2:2:N-1]))+2*sum(y([3:2:N-2]))+y(N);
    Sn=(h/3)*Sn;
    if i ~= 1
        preeh=eh;   %last eh
    end
    eh=abs(F-Sn);   %En
    if i ~= 1
        ok=log(preeh/eh)/log(2);
        fprintf('ok=%.15f\n',ok);
    end
    fprintf('  l=%d\tSn=%.15f\teh=%.15f\t',i,Sn,eh);
end
fprintf('\n');