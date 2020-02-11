function Xd = dyn(t,X,U,P,Sv)
    Xd = zeros(Sv.TOTAL_SV,1);
    th = X(Sv.itheta);
    thd = X(Sv.ithetad);
    sth = sin(th);
    cth = cos(th);
    % saturate input
    tau = U(Sv.it);
    tau(tau>P.tsat) = P.tsat ;
    tau(tau<-P.tsat) = -P.tsat ;
    % upper rows are found directly in state vector
    Xd(Sv.ix)  = X(Sv.ixd);
    Xd(Sv.itheta) = thd;
    % compute the lower rows
    a = P.h*cth;
    i = 1./(a^2-P.bc);
    d = P.mb*P.gGravity*P.L*sth - tau;
    e = P.mb*P.R*P.L*thd^2*sth + tau;
    
    Xd(Sv.ixd)  = -P.R*i*(a*d - P.b*e);
    Xd(Sv.ithetad) = i*(-P.c*d + a*e);
end

