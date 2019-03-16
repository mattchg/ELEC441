%% Initialization
            Constants;
            MotorSpecs;
            PropellerSpecs;
            
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
            M0(RotJ) = M0(RotJ)*milli;           

            M0(Weight) = M0(Weight)*milli;         
            M0(OuterDiam) = M0(OuterDiam)*milli;     
            M0(Length) = M0(Length)*milli;       
%% Propeller Inertia Calculation           
            PropellerJ = PropellerJ*(milli)*(centi)^2;
            CopterBodyJ32 = CopterBodyJ32*(milli)*(centi)^2;
            CopterBodyJ41 = CopterBodyJ41*(milli)*(centi)^2;

%% Calculations           
        %% Moment of Inertia for Mechanical System
        
    
            
%%     Transfer Functions      
        %% Motor/Mechanical Dynamics Model
            % MechX:             1
            %                ---------
            %                  Js + B
            % Torque/Velocity Transfer (No spring in model)


     

            % ElecX:             1
            %                ---------
            %                 Ls + R
            % Voltage/Current Transfer Function







