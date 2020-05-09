V=729;
E=2986;
x = random('Uniform',-10,30,1,E);
u = random('Discrete Uniform',V,1,E);
v = random('Discrete Uniform',V,1,E);
fout = fopen('input.txt','w+');
for i=1:E
    if(u(i) == v(i))
        v(i)=mod(v(i), V) +1;
    end
    if(mod(i,3) == 0 && x(i)<0) %随机生成太难没有负环了，手动改变部分负值
        x(i)=-x(i);
    end
    fprintf(fout,'%d %d %.0f\n',u(i),v(i),x(i));
end
fclose(fout);
