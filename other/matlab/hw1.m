%format long E

x = [.0 .5 1.0 sqrt(2) 10 100 300];
n = size(x,2);
y = zeros(n);
delta = 1e-6;

for i=1:n
    k=1;
    t=1/(k*(k+x(i)));
    if x(i) ~= 0
    while 1/(x(i)*k) > delta    %<1/(x*k)
        y(i)=y(i)+t;
        k=k+1;
        t=1/(k*(k+x(i)));
    end
    else                        %==0
        y(i)=y(i)+t;
        k=k+1;                  %let k=2
        t=1/(k*(k+x(i)));
        while 1/(k-1) > delta   %<1/(k-1) ¡Æ130_n^(+¡Ş)?1/k^2 <1/(k?1)
        y(i)=y(i)+t;
        k=k+1;
        t=1/(k*(k+x(i)));
        end
    end
    fprintf('x=%f,\ty=%.15f\n', x(i),y(i));
end

