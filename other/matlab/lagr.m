function ty = lagr(x,y,n,tx)
    %n points x,y ,input tx output ty
    tmp=1;
    ty=0;
    for i=1:n+1
        tmp=1;
        for j=1:n+1
            if j~=i
                tmp=tmp.*(tx-x(j))/(x(i)-x(j));
            end
        end
        ty=ty+tmp.*(y(i));
    end
end

