function [A,B] = num_jacobian(X, U, P, Sv)
    dX = diag([0.01, 0.01, 0.01, 0.01]);
    A = zeros(Sv.TOTAL_SV);
    for i = 1:Sv.TOTAL_SV
        dx = dX(i,:);
        delta_f = dyn(X+dx/2, U, P, Sv) - dyn(X-dx/2, U, P, Sv);
        delta_f = delta_f / dx(i);
        A(:,i) = delta_f;
    end

    dU = diag(0.01);
    delta_f = dyn(X, U+dU/2, P, Sv) - dyn(X, U-dU/2, P, Sv);
    delta_f = delta_f / dU;
    B = zeros(Sv.TOTAL_SV,Sv.TOTAL_CMD);
    B(:,1) = delta_f;
end