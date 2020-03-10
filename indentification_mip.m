clear all;
close all;
clc;
dt = 1/100e6; %100 mhz
M = readmatrix('planar_mip__controlled_training_traj.csv');
x_k = M(:,1);
theta_k = M(:,2);
xd_k = M(:,3);
thetad_k = M(:,4);
tau_k = M(:,5);
x_k1 = M(:,6);
theta_k1 = M(:,7);
xd_k1 = M(:,8);
thetad_k1 = M(:,9);

N = length(x_k);

H = zeros(4*N-1,20);
Y = zeros(4*N-1,1);

for i= 1:4:(N/4)
    H(i,:) = [xd_k(i) theta_k(i) xd_k(i) thetad_k(i) 0 0 0 0 0 0 0 0 0 0 0 0 tau_k(i) 0 0 0];
    H(i+1,:) = [0 0 0 0 xd_k(i) theta_k(i) xd_k(i) thetad_k(i) 0 0 0 0 0 0 0 0 0 tau_k(i) 0 0];
    H(i+2,:) = [0 0 0 0 0 0 0 0 xd_k(i) theta_k(i) xd_k(i) thetad_k(i) 0 0 0 0 0 0 tau_k(i) 0];
    H(i+3,:) = [ 0 0 0 0 0 0 0 0 0 0 0 0 xd_k(i) theta_k(i) xd_k(i) thetad_k(i) 0 0 0 tau_k(i)];
end 
for i =1:4:(N/4)
    Y(i) = x_k1(i);
    Y(i+1) = theta_k1(i);
    Y(i+2) = xd_k1(i);
    Y(i+3) = thetad_k1(i);
end

theta = pinv(H)*Y;
A_est = [
         theta(1) theta(2) theta(3) theta(4);
         theta(5) theta(6) theta(7) theta(8);
         theta(9) theta(10) theta(11) theta(12);
         theta(13) theta(14) theta(15) theta(16);
        ];
B_est = [theta(17);
         theta(18);
         theta(19);
         theta(20)
         ];
     
C = eye(4);
D = zeros(4,1);
sys_est = ss(A_est ,B_est, C, D, dt);
sysc = d2c(sys_est,'tustin');
eig(sysc.A)
step(sysc);