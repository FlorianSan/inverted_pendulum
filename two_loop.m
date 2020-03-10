function [Xd,U]=two_loop(t,X,target,P,Sv)
U = ctl(X,target,Sv);
Xd = dyn2(t,X,U,P,Sv);
end
