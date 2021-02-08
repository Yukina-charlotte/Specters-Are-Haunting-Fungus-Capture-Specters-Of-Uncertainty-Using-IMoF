function [Dr_sum,R]=simu(data,n,day)
	global alpha beta k rho;
	R=data(1:n,1);
	x=data(1:n,2);
	y=data(1:n,3);
    type=data(1:n,4);
	temp=data(n+1:n+day,1);
	hum=data(n+1:n+day,2);
    sum=0;
    for i=1:1:n
        m(i,1)=sqr(R(i))*rho(type(i))*pi;
    end
	for i=1:1:n
		for j=1:1:n
			d(i,j,1)=sqrt(sqr(x(i)-x(j))+sqr(y(i)-y(j)));
        end
    end
	for t=1:1:day-1
		for i=1:1:n
			R(i,t)=sqrt(m(i,t)/pi/rho(type(i)));
            if (t>=2)
                v(i,t)=R(i,t)-R(i,t-1);
                if (t==2)
                    last(i)=v(i,t);
                end
                if (v(i,t)>0.0001)
                    sum=sum+v(i,t);
                    last(i)=v(i,t);
                else
                    sum=sum+last(i);
                end
            end
			a=1;
			for j=1:1:n
				if (i~=j) 
					d(i,j,t)=d(i,j,1)-(R(i,t)+R(j,t));
				else
					d(i,j,t)=sqrt(k);
                end 
				a=a+sqr(k/sqr(d(i,j,t))*alpha(type(i),type(j))*m(j,t));
            end
			m(i,t+1)=m(i,t)*(beta*f(type(i),temp(t))+(1-beta)*g(type(i),hum(t))+1)/sqrt(a);
        end
    end
    Dr_sum=1.147*(0.616*sum+1.507)^(3/2)+1.48*sum+1.181;
end
