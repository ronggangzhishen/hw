fout = fopen('input_string.txt','w+');
x = random('Discrete Uniform',65535,1,2^15);
for i=1:2^15
    fprintf(fout,'%d\n',x(i));
end
fclose(fout);
    