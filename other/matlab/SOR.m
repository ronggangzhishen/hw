function x = SOR(A, b, MAX, tol,omiga)

n = length(b);                         % find n
D = diag(A);                           % extract diagonal of A
B = diag(D)-A;                         % init B
x = zeros(n,1);                        % initialize vector x
x = ones(n,1);
g = b./D;
for i=1:n
    for j=1:n
        if j~=i
            B(i,j)=B(i,j)/A(i,i);
        end
    end
end
for i=1:MAX
    u=x;
    
    for j=1:n
        
        x(j)=(1-omiga)*u(j)+omiga*(sum(x.*(B(j,:))')+g(j));
    end
    if max(abs(u-x)) < tol && i>10
        fprintf('¦Ø=%.2f,i=%d x=(',omiga,i);
        for k=1:n-1
            fprintf('%.5f,', x(k));
        end
        fprintf('%.5f)\n ', x(n));
        return;
    end
end
    %overbound
fprintf('¦Ø=%.2f,can not solve by SOR method\n',omiga);

end
