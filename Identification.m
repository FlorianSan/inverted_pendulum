% Identification d'un modèle du second ordre
clear all;
close all;
clc;
%creation du system continue
a1 = -3;
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

[u,t] = gensig('square',10,10); %generation du signal
[y,t,x] = lsim(sys, u, t);

N = length(y);
%bruit
br1 = randn(N, 1);
br2 = randn(N, 1);
%y = y + 0.05*[br1 br2];
plot(t,y(:,1),'+',t,u)
figure(2)
plot(t,y(:,2),'+',t,u)

%identification
H = [y(1:N-1,1) y(1:N-1,2) u(1:N-1)];
rank(H)
rank(H*H')
theta = inv(H'*H)*(y(2:N)*H)';

% Identification d'un modèle du second ordre
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
dt = 0.1;

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
rank(H)
rank(H*H')
theta = inv(H'*H)*H'*y(3:N);
alpha1 = theta(1)

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