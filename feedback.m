function Xd=feedback(t,X,K,target,P,Sv)
U = -K*(X-[target;0;0;0]);
Xd = dyn(t,X,U,P,Sv);
end
