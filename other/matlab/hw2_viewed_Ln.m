n = [5 10 20 40];
max_size=max(n);

x = zeros(1,max_size+1);	%for points
y = zeros(1,max_size+1);
f = @(x) 1./(1+x.^2);

li = zeros(1,max_size+1);	%for poly
Ln = zeros(1,max_size+1);
temp = zeros(2);

tx = zeros(1,500+1);		%for div
tlx = zeros(1,500+1);
tfx = zeros(1,500+1);
fprintf('x(i)=-5+10*i/n\n');
    for k=1:4          %n=5,10,20,40
        fprintf('n=%d\t',n(k));

        x=linspace(-5,5,n(k)+1);    %first kind
%         for i=0:n(k)        %second
%             x(i+1)=-5*cos((2*i+1)*pi/(2*n(k)+2));
%         end
		y=f(x);
        Ln = zeros(1,max_size+1);		%cal Ln
        for i=1:n(k)+1		%
            li=zeros(1,max_size+1);
            li(max_size+1)=1;		%li = 1
            for j=1:n(k)+1          % * n times
                if j~=i
                    temp=[1/(x(i)-x(j)),-x(j)/(x(i)-x(j))];	
                    li=conv(li,temp);
                    li=li(end-max_size:end);
                end
            end
            Ln=Ln+y(i)*li;
        end
        Ln complete
		tx=linspace(-5,5,501);
		tfx=f(tx);
		tlx=polyval(Ln,tx);
        d=max(abs(tfx-tlx));
        fprintf('d=%d\n',d);
%         hold on;
%         plot(tx,tlx);
%         plot(tx,tfx);
    end