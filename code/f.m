function s=f(i,temp)
    global f_k;
    a=f_k(i,1);
    b=f_k(i,2);
    c=f_k(i,3);
    d=f_k(i,4);
    if (temp<d)
        s=a*exp(-1/b*sqr(temp-d));
    else
        s=a*exp(-1/c*sqr(temp-d));
    end
end
