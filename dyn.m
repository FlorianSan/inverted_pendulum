function Xd = dyn(t,X,U,P,Sv)

    %tau couple d'entrée avec saturation 
    
    Xd = zeros(Sv.TOTAL_SV,1);
    th = X(Sv.itheta);
    thd = X(Sv.ithetad);
    
   
    % saturate input
    tau = U(Sv.it);  
    tau(tau>P.tsat) = P.tsat ;
    tau(tau<-P.tsat) = -P.tsat ;
    % on recupere x et theta
    Xd(Sv.ix)  = X(Sv.ixd);
    Xd(Sv.itheta) = thd;
    % compute the lower rows
    a = P.h*cos(th);
    i = 1./(a^2-P.bc);
    d = P.mb*P.gGravity*P.L*sin(th) - tau;
    e = P.mb*P.R*P.L*thd^2*sin(th) + tau;
    
    Xd(Sv.ixd)  = -P.R*i*(a*d - P.b*e);
    Xd(Sv.ithetad) = i*(-P.c*d + a*e);
end

