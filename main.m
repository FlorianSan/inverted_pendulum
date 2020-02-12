%Inverted pendulum plan model, Deloye Lucas - Sansou Florian
close all;
clear all;


P = Param;
Sv = SV;
U = 0;

%Open Loop
X0 = [0; 0.01; 0; 0];
tspan = [0 10];
[t,X] = ode45(@(t,X)dyn(t,X,U,P,Sv),tspan,X0);
U = zeros(length(t),1);
affichage(X,t,Sv);

%feedback
%[t,X] = ode45(@(t,X)feedback(t,X,K,P,Sv),tspan,X0);


[A, B] = num_jacobian([0 0 0 0], 0, P,Sv)
eig(A)
ctrb(A, B)


%pole
poles = [-2 -3 -4 -5];
K = place(A, B, poles)
eig(A-B*K)
[t,X] = ode45(@(t,X)feedback(t,X,K,P,Sv),tspan,X0);
U = -K*X';


%lqr
Q = diag([10, 1, 1, 1]);
R = diag(2);
[K_lqr,S,E] = lqr(A,B,Q,R);
eig(A-B*K_lqr)
[t,X] = ode45(@(t,X)feedback(t,X,K_lqr,P,Sv),tspan,X0);
U = -K*X';
affichage(X,t,Sv);
