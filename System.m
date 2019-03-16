%% Initialization
            Constants;
            MotorSpecs;
            PropellerSpecs;
            Time;
            DroneSpecs;
            
%%  Unit Conversions (Kg,m,s,N,A,V,Rad/Sec,Heneries,Ohms)             
            % Values at Nominal Voltage
            M0(NomV) = M0(NomV);        
            M0(NoLoadSpd)= M0(NoLoadSpd)*RadPSecPerRPM;     
            M0(NoLoadCurr)= M0(NoLoadCurr)*milli;  
            M0(NomSpd) = M0(NomSpd)*RadPSecPerRPM;        
            M0(NomTorque) = M0(NomTorque)*milli;   
            M0(NomCurr) = M0(NomCurr);        
            M0(StallTorque) = M0(StallTorque)*milli;    
            M0(StallCurr) = M0(StallCurr);     
            M0(TermR) = M0(TermR);          
            M0(TermL) = M0(TermL)*milli;         
            M0(TorqueK)=M0(TorqueK)*milli;      
            M0(SpdK)= 1/(M0(SpdK)*RadPSecPerRPM);           
            M0(RotJ) = M0(RotJ)*milli*(centi)^2;           

            M0(Weight) = M0(Weight)*milli;         
            M0(OuterDiam) = M0(OuterDiam)*milli;     
            M0(Length) = M0(Length)*milli;      
            
            PropDiameter = PropDiameter*CMPerInch*centi;
            PropWeight = GramPerOz*milli;
            DroneMomentArm = MomentArm*centi;
            
%% Calculations      
    % From Linearization
        linearizedFrictionCoef = 3.1153e-05;
        linearizedThrustGain = 0.0027;

    % Propeller Inertia Calculation           
        PropellerJ = (1/2)*PropWeight*(PropDiameter/2)^2;

    % Motor Selection
        M1 = M0;
        M2 = M0;
        M3 = M0;

    %Rotor Dynamic Friction
        M0_dyn_fric = M0(TorqueK)*M0(NoLoadCurr)/M0(NoLoadSpd);
        M1_dyn_fric = M1(TorqueK)*M1(NoLoadCurr)/M1(NoLoadSpd);
        M2_dyn_fric = M2(TorqueK)*M2(NoLoadCurr)/M2(NoLoadSpd);
        M3_dyn_fric = M3(TorqueK)*M3(NoLoadCurr)/M3(NoLoadSpd);
    %Equilibrium voltage
        Vnom = 11;

%% Moment of Inertia for Mechanical System
            
%%     Transfer Functions      
        %% Motor/Mechanical Dynamics Model
            % MechX:             1
            %                ---------
            %                  Js + B
            % Torque/Velocity Transfer (No spring in model)
            
            MECH0_NUM = [1]; %#ok<*NBRAK>
            MECH0_DEN = [M0(RotJ)+PropellerJ,M0_dyn_fric+linearizedFrictionCoef];
            MECH0 = tf(MECH0_NUM,MECH0_DEN);

            MECH1_NUM = [1];
            MECH1_DEN = [M1(RotJ)+PropellerJ,M1_dyn_fric+linearizedFrictionCoef];
            MECH1 = tf(MECH1_NUM,MECH1_DEN);

            MECH2_NUM = [1];
            MECH2_DEN = [M2(RotJ)+PropellerJ,M2_dyn_fric+linearizedFrictionCoef];
            MECH2 = tf(MECH2_NUM,MECH2_DEN);
            
            MECH3_NUM = [1];
            MECH3_DEN = [M2(RotJ)+PropellerJ,M3_dyn_fric+linearizedFrictionCoef];
            MECH3 = tf(MECH3_NUM,MECH3_DEN);

            % ElecX:             1
            %                ---------
            %                 Ls + R
            % Voltage/Current Transfer Function

            ELEC0_NUM = [1];
            ELEC0_DEN = [M0(TermL),M0(TermR)];
            ELEC0 = tf(ELEC0_NUM,ELEC0_DEN);

            ELEC1_NUM = [1];
            ELEC1_DEN = [M1(TermL),M1(TermR)];
            ELEC1 = tf(ELEC1_NUM,ELEC1_DEN);

            ELEC2_NUM = [1];
            ELEC2_DEN = [M2(TermL),M2(TermR)];
            ELEC2 = tf(ELEC2_NUM,ELEC2_DEN);
            
            ELEC3_NUM = [1];
            ELEC3_DEN = [M3(TermL),M3(TermR)];
            ELEC3 = tf(ELEC3_NUM,ELEC3_DEN);
            

            
            
            