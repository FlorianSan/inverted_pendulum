function Xd = dyn(X,U,P,Sv)
    Xd = zeros(1,Sv.TOTAL_SV);
    th = X(Sv.itheta);
    thd = X(Sv.ithetad);
    sth = math.sin(th);
    cth = math.cos(th);
    % saturate input
    tau = clip(U(Sv.it), -P.tsat, P.tsat);
    % upper rows are found directly in state vector
    Xd(ix)  = X(Sv.ixd);
    Xd(itheta) = thd;
    % compute the lower rows
    a = P.h*cth;
    i = 1./(a^2-P.bc);
    d = P.mb*P.g*P.L*sth - tau;
    e = P.mb*P.R*P.L*thd^2*sth + tau;
    
    Xd(s_xd)  = -P.R*i*(a*d - P.b*e);
    Xd(s_thetad) = i*(-P.c*d + a*e);
end

