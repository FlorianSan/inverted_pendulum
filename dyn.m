function Xd = dyn(X,P,U,Sv)
    Xd = zeros(1,Sv.TOTAL_SV);
    th = X(Sv.itheta);
    thd = X(Sv.ithetad);
    sth = math.sin(th);
    cth = math.cos(th);
end

