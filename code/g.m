function s=g(i,hum)
    global g_k;
    a=g_k(i,1);
    b=g_k(i,2);
    c=g_k(i,3);
    d=g_k(i,4);
    if (hum<d)
        s=a*exp(-1/b*sqr(hum-d));
    else
        s=a*exp(-1/c*sqr(hum-d));
    end
end
