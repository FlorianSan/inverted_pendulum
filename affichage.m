function [] = affichage(X, U, t, Sv, Xautre, Uautre)
figure
subplot(3,2,1)
plot(t,X(:,Sv.ix),'Color', 'b', 'LineWidth',2)
if nargin == 6
    hold on;
    plot(t,Xautre(:,Sv.ix),'Color', 'r', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('x (m)','FontSize',20)
title("Evolution de X") 

subplot(3,2,2)
plot(t,X(:,Sv.itheta),'Color', 'b', 'LineWidth',2)
if nargin == 6
    hold on;
    plot(t,Xautre(:,Sv.itheta),'Color', 'r', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('theta (rad)','FontSize',20)
title("Evolution de theta")

subplot(3,2,3)
plot(t,X(:,Sv.ixd),'Color', 'b', 'LineWidth',2)
if nargin == 6
    hold on;
    plot(t,Xautre(:,Sv.ixd),'Color', 'r', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('xdot (m/s)','FontSize',20)
title("Evolution de Xdot")

subplot(3,2,4)
plot(t,X(:,Sv.ithetad),'Color', 'b', 'LineWidth',2)
if nargin == 6
    hold on;
    plot(t,Xautre(:,Sv.ithetad),'Color', 'r', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('thetadot (rad/s)','FontSize',20)
title("Evolution de thetadot")
 
subplot(3,2,[5 6])
plot(t,U,'Color', 'b', 'LineWidth',2)
if nargin == 6
    hold on;
    plot(t,Uautre,'Color', 'r', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('U (normalement N.m)','FontSize',20)
title("Commande")

hold on
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
end
