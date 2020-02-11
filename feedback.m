function Xd=feedback(t,X,K,P,Sv)
Xd = dyn(t,X,-K*X,P,Sv);
end
