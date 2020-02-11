classdef SV
   properties
        %-------------------------
        % Indexation des composantes du vecteur d'etat
        ix      = 1;  % horizontal pos of the wheel axis in m
        itheta  = 2;  % orientation of the body in rad, 0 up
        ixd     = 3;  % horizontal velocity of the wheel axis in m/s
        ithetad = 4; % rotational velocity of the body in rad/s
        TOTAL_SV   = 4;  % dimension of the state vector

        %-------------------------
        % Indexation des composantes du vecteur de commande

        it = 1; % torque on the wheel axis in N.m
        TOTAL_CMD = 1;  % dimension of the input vector
   end 
end