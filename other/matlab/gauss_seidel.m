function x = gauss_seidel(A, b, MAX, tol)

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
B;
for i=1:MAX
    u=x;
    for j=1:n
        x(j)=sum(x.*(B(j,:))')+g(j);
    end
    if max(abs(u-x)) < tol 
        i
        return;
    end
end
        
    
end

