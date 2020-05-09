function x = gauss(A, b)
% Gaussian elimination algorithm
% Inputs: A coefficients and b right side vector
% Output: the solution of Ax = b
assert(size(A, 1) == size(b, 1));
n = size(A, 1);
A
for k = 1:n-1 
    t1=zeros(1,n);
    for m=k:n
        t1(m)=A(m,k);
    end
    [t,m]=max(t1);
    if(m ~= k)
        t1=A(k);
        A(m)=t1;
    end
    for i = k+1:n
        z = A(i, k) / A(k, k);
        for j = k+1:n
            A(i, j) = A(i, j) - z * A(k, j);
        end
        b(i) = b(i) - z * b(k);
    end    
end
A
for i = n:-1:1
    tmp = 0;
    for j = i+1:n
        tmp = tmp + A(i, j) * x(j,1);
    end        
    x(i,1) = (b(i)  - tmp) / A(i, i);
end

end