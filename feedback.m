function Xd=feedback(t,X,K,P,Sv)
U = -K*X;
Xd = dyn(t,X,U,P,Sv);
end
