%Inverted pendulum plan model, Deloye Lucas - Sansou Florian
close all;
clear all;


P = Param;
Sv = SV;
U = 0;

X0 = 0;
time = (0:0.01:10);
X = ode45(dyn, time, X0, , args=(U, P ))
U = zeros((length(time), 1));