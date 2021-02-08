function [sum,r]=main(climate,time,dis_ty)
    global alpha beta k rho f_k g_k;
    beta=0.3; 
    k=0.01;
    coe=importdata('coefficient.xlsx');
    tablea=coe.data.alpha;
    alpha=tablea(2:14,2:14);
    rho=coe.data.rho;
    f_k=coe.data.f_k;
    g_k=coe.data.g_k;
    da=importdata('data.xlsx');
    switch dis_ty
        case 'S'
            po=da.po1;
        case 'M'
            po=da.po2;
        case 'L'
            po=da.po3;
    end
    n=po(1,1);
    data(1:n,1)=0.005;
    data(1:n,2)=po(2:n+1,1);
    data(1:n,3)=po(2:n+1,2);
    data(1:n,4)=po(2:n+1,3);
    switch climate
        case 'arid'
            table=da.arid;
        case 'semi-arid'
            table=da.smar;
        case 'temperate'
            table=da.tepr;
        case 'arboreal'
            table=da.arbo;
        case 'tropical rain forests'
            table=da.rafo;
        case '2070'
            table=da.y2070;
        case '2120'
            table=da.y2120;
        otherwise 
            table=da.other;
    end  
    if (time==1)
        day=360;
        for i=1:1:10
            data(n+(i-1)*day+1:n+i*day,1)=table(1:360,1);
            data(n+(i-1)*day+1:n+i*day,2)=table(1:360,3);
        end
        day=3600;
    else
        day=60;
        data(n+1:n+day,1)=table(361:420,1);
        data(n+1:n+day,2)=table(361:420,3);
    end
    [sum,r]=simu(data,n,day);
end

