% Identification d'un modèle du second ordre deux sortie
clear all;
close all;
clc;
%creation du system continue
a1 = -1;
a2 = 0;
a3 = 0;
a4 = -2;

b1 = 1;
b2 = 1;

c1 = 1;
c2 = 0;
c3 = 0;
c4 = 1;

A = [a1 a2; a3 a4];
B = [b1; b2];
C = [c1 c2; c3 c4];
D = [0];
sys = ss(A,B,C,D);
dt = 0.1;
[u,t] = gensig('square',10,10,0.1); %generation du signal
[y,t,x] = lsim(sys, u, t);

N = length(y);
%bruit
br1 = randn(N, 1);
br2 = randn(N, 1);
y = y + 0.05*[br1 br2];

H = [];
Y = [];
%identification
for i= 1:N-1
    H = [H;y(i,1) y(i,2) 0 0 u(i) 0; 0 0 y(i,1) y(i,2) 0 u(i)];
end 
for i =2:N
    Y = [Y;y(i,1);y(i,2)];
end
rank(H);
rank(H*H');
theta = pinv(H)*Y

A_est = [theta(1) theta(2); theta(3) theta(4)];
B_est = [theta(5); theta(6)];
sys_est = ss(A_est ,B_est, C, D, dt);
sysc = d2c(sys_est);
[y_est,t,x] = lsim(sysc, u, t);
plot(t,y(:,1),'+',t,y_est(:,1),t,u)
figure(2)
plot(t,y(:,2),'+',t,y_est(:,2),t,u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Identification d'un modèle du second ordre une sortie 
clear all;
close all;
clc;
%creation du system continue
a1 = -1;
a2 = 0;
a3 = 0;
a4 = -2;

b1 = 1;
b2 = 1;

c1 = 1;
c2 = 1;

A = [a1 a2; a3 a4];
B = [b1; b2];
C = [c1 c2];
D = [0];
sys = ss(A,B,C,D);
dt = 0.01;

%discretisation avant identification?

[u,t] = gensig('square',10,10,dt); %generation du signal
[y,t,x] = lsim(sys, u, t);
N = length(y);
%bruit
br = randn(N, 1);
%y = y + 0.05*br;
plot(t,y,'+',t,u)


%identification
H = [-y(2:N-1) -y(1:N-2) u(2:N-1) u(1:N-2)];
rank(H);
rank(H*H');
theta = inv(H'*H)*H'*y(3:N);
alpha1 = theta(1);
alpha2 = theta(2);
X = (-alpha1-sqrt(alpha1^2-4*alpha2))/2;
a4_estime = log(X)/dt;
a1_estime  = (log(alpha2)/dt)- a4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%identification systeme transfert fonction
clear all;
close all;
clc;


dt = 0.1;
[u,t] = gensig('square',10,10,dt);
sys_tf = tf([1], [1, 3, 2]);
[y,t,x] = lsim(sys_tf, u, t);
N = length(y);
br = randn(N, 1);
y_bruit = y + 0.05*br;
 

H = [-y(2:N-1) -y(1:N-2) u(2:N-1) u(1:N-2)];
rank(H)
rank(H*H')
theta = inv(H'*H)*H'*y(3:N);
plot(t,y_bruit,'+',t,u)