function Xd=two_loop(t,X,P,Sv)
sp_x = 0.1;
e_x= X(Sv.ix)-sp_x;
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
