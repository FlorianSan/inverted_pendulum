function Xd=two_loop(t,X,target,P,Sv)
e_x= X(Sv.ix)-target;
e_xd = X(Sv.ixd);
Kp = 2;
Kd = 4;
sp_theta = Kp*e_x + Kd*e_xd;
e_theta = X(Sv.itheta)-sp_theta;
e_thetad =  X(Sv.ithetad);
Kp = 6;
Kd = 6;
U = Kp*e_theta + Kd*e_thetad;
Xd = dyn(t,X,U,P,Sv);
end
