function [] = affichage(Sv, Courbe1, Courbe2, Courbe3)
figure
subplot(3,2,1)
plot(Courbe1.t,Courbe1.X(:,Sv.ix),'Color', 'b', 'LineWidth',2)
if nargin == 3
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ix),'Color', 'r', 'LineWidth',2)
elseif nargin == 4
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ix),'Color', 'r', 'LineWidth',2)
    hold on;
    plot(Courbe3.t,Courbe3.X(:,Sv.ix),'Color', 'g', 'LineWidth',2) 
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('x (m)','FontSize',20)
title("Evolution de X") 

subplot(3,2,2)
plot(Courbe1.t,Courbe1.X(:,Sv.itheta),'Color', 'b', 'LineWidth',2)
if nargin == 3
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.itheta),'Color', 'r', 'LineWidth',2)
elseif nargin == 4
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.itheta),'Color', 'r', 'LineWidth',2)
    hold on;
    plot(Courbe3.t,Courbe3.X(:,Sv.itheta),'Color', 'g', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('theta (rad)','FontSize',20)
title("Evolution de theta")

subplot(3,2,3)
plot(Courbe1.t,Courbe1.X(:,Sv.ixd),'Color', 'b', 'LineWidth',2)
if nargin == 3
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ixd),'Color', 'r', 'LineWidth',2)
elseif nargin == 4
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ixd),'Color', 'r', 'LineWidth',2)
    hold on;
    plot(Courbe3.t,Courbe3.X(:,Sv.ixd),'Color', 'g', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('xdot (m/s)','FontSize',20)
title("Evolution de Xdot")

subplot(3,2,4)
plot(Courbe1.t,Courbe1.X(:,Sv.ithetad),'Color', 'b', 'LineWidth',2)
if nargin == 3
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ithetad),'Color', 'r', 'LineWidth',2)
elseif nargin == 4
    hold on;
    plot(Courbe2.t,Courbe2.X(:,Sv.ithetad),'Color', 'r', 'LineWidth',2)
    hold on;
    plot(Courbe3.t,Courbe3.X(:,Sv.ithetad),'Color', 'g', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('thetadot (rad/s)','FontSize',20)
title("Evolution de thetadot")
 
subplot(3,2,[5 6])
plot(Courbe1.t,Courbe1.U,'Color', 'b', 'LineWidth',2)
if nargin == 3
    hold on;
    plot(Courbe2.t,Courbe2.U,'Color', 'r', 'LineWidth',2)
elseif nargin == 4
    hold on;
    plot(Courbe2.t,Courbe2.U,'Color', 'r', 'LineWidth',2)
    hold on;
    plot(Courbe3.t,Courbe3.U,'Color', 'g', 'LineWidth',2)
end
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
xlabel('Temps (s)','FontSize',20)
ylabel('U (normalement N.m)','FontSize',20)
title("Commande")

hold on
set(gca,{'FontSize'},{18},{'xcolor'},{'k'})
legend({Courbe1.Name, Courbe2.Name, Courbe3.Name})
end
