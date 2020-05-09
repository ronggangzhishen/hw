x = random('Discrete Uniform',26,24,90);

fout = fopen('inputA.txt','w+');
for i=1:12
    for j=1:90
        fprintf(fout,'%c',x(i,j)+'A'-1);
    end
    fprintf(fout,'\n');
end
fclose(fout);
fout = fopen('inputA.txt','w+');
for i=13:24
    for j=1:90
        fprintf(fout,'%c',x(i,j)+'A'-1);
    end
    fprintf(fout,'\n');
end
fclose(fout);