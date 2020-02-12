function [] = affichage(X, t, Sv)
figure
subplot(2,2,1)
plot(t,X(:,Sv.ix),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('x (m)','FontSize',22)
title("Evolution de X") 

subplot(2,2,2)
plot(t,X(:,Sv.itheta),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('theta (rad)','FontSize',22)
title("Evolution de theta")

subplot(2,2,3)
plot(t,X(:,Sv.ixd),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('xdot (m/s)','FontSize',22)
title("Evolution de Xdot")

subplot(2,2,4)
plot(t,X(:,Sv.ithetad),'Color', 'b', 'LineWidth',2)
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',22)
ylabel('thetadot (rad/s)','FontSize',22)
title("Evolution de thetadot")

hold on
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
end
