%Inverted pendulum plan model, Deloye Lucas - Sansou Florian
close all;
clear all;


P = Param;
Sv = SV;
U = 0;

%Open Loop
X0 = [0 0.01 0 0];
tspan = [0 10];
[t,X] = ode45(@(t,X)dyn(t,X,U,P,Sv),tspan,X0);
U = zeros(length(t),1);

%affichage de x
plot(t,X(:,Sv.ix));
%affichage de xdot
plot(t,X(:,Sv.ixd));
%affichage de theta
plot(t,X(:,Sv.itheta));
%affichage de thetadot
plot(t,X(:,Sv.ithetad));

%feedback
K = 10;
[t,X] = ode45(@(t,X)feedback(t,X,K,P,Sv),tspan,X0);



