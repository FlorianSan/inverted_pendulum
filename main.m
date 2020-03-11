%Inverted pendulum plan model, Deloye Lucas - Sansou Florian
close all;
clear all;


P = Param;
Sv = SV;
U = 0;
target = 2; %m


%Open Loop
X0 = [0; 0; 0; 0];
tspan = 0:.01:10;
%opts = odeset();
[OpenLoop.t,OpenLoop.X] = ode45(@(t,X)dyn2(t,X,U,P,Sv),tspan,X0);
OpenLoop.U = zeros(length(tspan),1);
OpenLoop.Name = "Open Loop";
affichage(OpenLoop, tl);
%feedback
%[t,X] = ode45(@(t,X)feedback(t,X,K,P,Sv),tspan,X0);


[A, B] = num_jacobian([0 0 0 0], 0, P,Sv);
eig(A);
ctrb(A, B);


%pole
poles = [-2 -3 -4 -5];
K = place(A, B, poles);
eig(A-B*K);
[Pole.t,Pole.X] = ode45(@(t,X)feedback(t,X,K,target,P,Sv),tspan,X0);
Pole.U = -K*(Pole.X'-[target;0;0;0]);
Pole.Name = "Placement de Poles";

%lqr
Q = diag([10, 1, 1, 1]);
R = diag(2);
[K_lqr,S,E] = lqr(A,B,Q,R);
eig(A-B*K_lqr);
[LQR.t,LQR.X] = ode45(@(t,X)feedback(t,X,K_lqr,target,P,Sv),tspan,X0);
LQR.U = -K_lqr*(LQR.X'-[target;0;0;0]);
LQR.Name = "LQR";

%two loop


[tl.t,tl.X] = ode45(@(t,X)two_loop(t,X,target,P,Sv),tspan,X0);
%problem avec U 
tl.U = ctl(tl.X,target, Sv);
tl.Name = "Two loop";



affichage(Sv, LQR, Pole, tl);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sysd = fct_identification('rosmip_io_1_step_lin.csv');
sysd2 = fct_identification('rosmip_io_1_static.csv');
sysc = d2c(sysd,'tustin');
sysc2 = d2c(sysd2,'tustin');
sysc.A
sysc2.A
eig(sysc.A)
eig(sysc2.A)
[u,t] = gensig('square',5,10); %generation du signal
[y,t,x] = lsim(sysc2, u, t);
subplot(5,1,1);
plot(t,y(:,1));
subplot(5,1,2);
plot(t,y(:,2))
subplot(5,1,3);
plot(t,y(:,3))
subplot(5,1,4);
plot(t,y(:,4))
subplot(5,1,5);
plot(t,u)