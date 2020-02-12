function [] = affichage(X, U, t, Sv)
figure
subplot(3,2,1)
plot(t,X(:,Sv.ix),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('x (m)','FontSize',22)
title("Evolution de X") 

subplot(3,2,2)
plot(t,X(:,Sv.itheta),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('theta (rad)','FontSize',22)
title("Evolution de theta")

subplot(3,2,3)
plot(t,X(:,Sv.ixd),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('xdot (m/s)','FontSize',22)
title("Evolution de Xdot")

subplot(3,2,4)
plot(t,X(:,Sv.ithetad),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('thetadot (rad/s)','FontSize',22)
title("Evolution de thetadot")

subplot(3,2,[5 6])
plot(t,U,'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('U (normalement N.m)','FontSize',22)
title("Commande")

hold on
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
end
