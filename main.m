%Inverted pendulum plan model, Deloye Lucas - Sansou Florian
close all;
clear all;


P = Param;
Sv = SV;
U = 0;

X0 = [0 0.01 0 0];
tspan = [0 10];
%ode45(@(t,y)Reactor_simple_ODE(t,y,a1,a2,a3),span,init,options);
test = dyn(0,X0,U,P,Sv);
[t,X] = ode45(@(t,X)dyn(t,X,U,P,Sv),tspan,X0);
%U = zeros((length(time), 1));

%affichage de x
plot(t,X(:,Sv.ix));
%affichage de xdot
plot(t,X(:,Sv.ixd));
%affichage de theta
plot(t,X(:,Sv.itheta));
%affichage de thetadot
plot(t,X(:,Sv.ithetad));