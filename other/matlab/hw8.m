format long;
ori_A=[3 2 5 4 6;
   2 1 3 -7 8;
   5 3 2 5 -4;
   4 -7 5 1 3;
   6 8 -4 3 8];
%A=[2,-1,3;-1,5,0;3,0,1];
A=ori_A;
n = size(A, 1);
v = eye(n);
for i=1:10^3
    tA=abs(A-diag(diag(A)));
    [t1,p]=max(tA);    %max row
    [t2,q]=max(t1);   %max col
    if t2 < 10^-7
        break;
    end
    p=p(q);          %tt=A(p,q)
    %fprintf('p=%d q=%d\n',p,q);
    s=(A(q,q)-A(p,p))/(2*A(p,q));
    if s >= 0
        t = 1/(s+(s^2+1)^0.5);
    else
        t = 1/(s-(s^2+1)^0.5);
    end%t=-s+(s^2+1)^0.5;
    c=1/((1+t^2)^0.5);
    d=t/((1+t^2)^0.5);
    Q=diag(ones(1,n));
    Q(p,p)=c;Q(q,q)=c;Q(p,q)=d;Q(q,p)=-d;
    v = v*Q;
    A=Q'*A*Q;
    
end
diagA=diag(A);
for i=1:n
    fprintf('¦Ë%d=%.15f\n',i,diagA(i));
    fprintf('\tv%d = \n',i);
    disp(v(:,i));
end