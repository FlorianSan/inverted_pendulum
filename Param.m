classdef Param
   properties
        R = 0.04;       %radius of wheel in m
        L = 0.1;        %distance from wheel axis to body center of mass in m
        mw = 0.02;      %mass of the wheel in kg
        mb =0.2;        %mass of the body in kg
        Iw = 0.00025;   %inertia of wheel
        Ib = 0.003;     %inertia of body 
        tsat = 10;      %max torque of the motor N.m
        gGravity = 9.81;       %gravite
        b ;
        c;
        bc;
        h;
   end 
   methods 
          function this = Param()
              this.b = this.Ib + this.mb * this.L^2; % inertie du corp
              this.c = this.Iw + (this.mw+this.mb) * this.R^2; %inertie de la roue
              this.bc = this.b * this.c;
              this.h = this.mb * this.R * this.L;
          end
   end
end