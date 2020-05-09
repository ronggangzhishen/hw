
n = [5 10 20 40];
max_size=max(n);

x = zeros(1,max_size+1);	%for points
y = zeros(1,max_size+1);
f = @(x) 1./(1+x.^2);

tx = zeros(1,500+1);		%for div
tlx = zeros(1,500+1);
tfx = zeros(1,500+1);

fprintf('x(i)=-5+10*i/n\n');
    for k=1:4          %n=5,10,20,40
        fprintf('n=%d\t',n(k));

        x=linspace(-5,5,n(k)+1);    %first kind

		y=f(x);

		tx=linspace(-5,5,501);
		tfx=f(tx);
		tlx=lagr(x,y,n(k),tx);
        d=max(abs(tfx-tlx));
        fprintf('d=%d\n',d);
    end
        
fprintf('x(i)=-5*cos((2*i+1)*pi/(2*n(k)+2))\n');
    for k=1:4          %n=5,10,20,40
        fprintf('n=%d\t',n(k));
        for i=0:n(k)        %second
            x(i+1)=-5*cos((2*i+1)*pi/(2*n(k)+2));
        end
		y=f(x);

		tx=linspace(-5,5,501);
		tfx=f(tx);
		tlx=lagr(x,y,n(k),tx);
        d=max(abs(tfx-tlx));
        fprintf('d=%d\n',d);
    end