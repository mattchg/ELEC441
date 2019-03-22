%% Initialization
System;


%% Model 1

A = [ -1*M0(TermR)/M0(TermL) 0 0 0 -1*M0(SpdK)/M0(TermL) 0 0 0;
       0 -1*M1(TermR)/M1(TermL) 0 0 0 -1*M1(SpdK)/M1(TermL) 0 0;
       0 0 -1*M2(TermR)/M2(TermL) 0 0 0 -1*M2(SpdK)/M2(TermL) 0;
       0 0 0 -1*M3(TermR)/M3(TermL) 0 0 0 -1*M3(SpdK)/M3(TermL);
       M0(TorqueK)/PropellerJ 0 0 0 (-2*linearizedFrictionCoef*RadSec_SS-M0_dyn_fric)/PropellerJ 0 0 0;
       0 M1(TorqueK)/PropellerJ 0 0 0 (-2*linearizedFrictionCoef*RadSec_SS-M1_dyn_fric)/PropellerJ  0 0;
       0 0 M2(TorqueK)/PropellerJ 0 0 0 (-2*linearizedFrictionCoef*RadSec_SS-M2_dyn_fric)/PropellerJ  0;
       0 0 0 M2(TorqueK)/PropellerJ 0 0 0 (-2*linearizedFrictionCoef*RadSec_SS-M3_dyn_fric)/PropellerJ; ];

B =[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;];

C = 2*linearizedThrustGain*RadSec_SS*DroneMomentArm*[0 0 0 0 1 -1 0 0;
                                                     0 0 0 0 0 0 1 -1];
                                                 
D = zeros(2,4); 


sys = ss(A,B,C,D);

systf=tf(sys);

%%     Transfer Functions      
        %% Motor/Mechanical Dynamics Model
            % MechX:             1
            %                ---------
            %                  Js + B
            % Torque/Velocity Transfer (No spring in model)
            
          
           Motor1 = systf(1,1);
           Motor2 = systf(1,2);
           Motor3 = systf(2,3); 
           Motor4 = systf(2,4); 
       



                                                 