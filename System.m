%% Initialization
            Constants;

%%  Unit Conversions (Kg,m,s,N,A,V,Rad/Sec,Heneries,Ohms)             
            M0(NoLoadSpd) = M0(NoLoadSpd)*RadPSecPerRPM; %RPM to RAD/SEC
            M0(NomTorque) = M0(NomTorque)*milli;
            M0(StallTorque) = M0(StallTorque)*milli;
            M0(TermL) = M0(TermL)*milli;
            M0(RotJ) = M0(RotJ)*(milli)*(centi)^2;   %gram*cm^2 => kg*m^2
            M0(Weight) = M0(Weight)*milli;
            M0(OuterDiam) = M0(OuterDiam)*milli;
            M0(Length) = M0(Length)*milli;
            M0(TorqueK) = M0(TorqueK)*milli; %mNm => Nm
            M0(SpdK) = M0(TorqueK);
            M0(DynFric) = M0(DynFric)*micro;

            M1(NoLoadSpd) = M1(NoLoadSpd)*RadPSecPerRPM; %RPM to RAD/SEC
            M1(NomTorque) = M1(NomTorque)*milli;
            M1(StallTorque) = M1(StallTorque)*milli;
            M1(TermL) = M1(TermL)*milli;
            M1(RotJ) = M1(RotJ)*(milli)*(centi)^2;   %Gram*cm^2 => kg*m^2
            M1(Weight) = M1(Weight)*milli;
            M1(OuterDiam) = M1(OuterDiam)*milli;
            M1(Length) = M1(Length)*milli;
            M1(TorqueK) = M1(TorqueK)*milli;
            M1(SpdK) = M0(TorqueK);
            M1(DynFric) = M1(DynFric)*micro;
            
            M2(NoLoadSpd) = M2(NoLoadSpd)*RadPSecPerRPM; %RPM to RAD/SEC
            M2(NomTorque) = M2(NomTorque)*milli;
            M2(StallTorque) = M2(StallTorque)*milli;
            M2(TermL) = M2(TermL)*milli;
            M2(RotJ) = M2(RotJ)*(milli)*(centi)^2;   %Gram*cm^2 => kg*m^2
            M2(Weight) = M2(Weight)*milli;
            M2(OuterDiam) = M2(OuterDiam)*milli;
            M2(Length) = M2(Length)*milli;
            M2(TorqueK) = M2(TorqueK)*milli;
            M2(SpdK) = M0(TorqueK);
            M2(DynFric) = M2(DynFric)*micro;
            
            M3(NoLoadSpd) = M3(NoLoadSpd)*RadPSecPerRPM; %RPM to RAD/SEC
            M3(NomTorque) = M3(NomTorque)*milli;
            M3(StallTorque) = M3(StallTorque)*milli;
            M3(TermL) = M3(TermL)*milli;
            M3(RotJ) = M3(RotJ)*(milli)*(centi)^2;   %Gram*cm^2 => kg*m^2
            M3(Weight) = M3(Weight)*milli;
            M3(OuterDiam) = M3(OuterDiam)*milli;
            M3(Length) = M3(Length)*milli;
            M3(TorqueK) = M3(TorqueK)*milli;
            M3(SpdK) = M0(TorqueK);
            M3(DynFric) = M3(DynFric)*micro;
            
            PropellerJ = PropellerJ*(milli)*(centi)^2;
            CopterBodyJ32 = CopterBodyJ32*(milli)*(centi)^2;
            CopterBodyJ41 = CopterBodyJ41*(milli)*(centi)^2;

%% Calculations           
        %% Moment of Inertia for Mechanical System
        
           %DOF32 - DOF along axis defined by motors 3 and 2;
           DOF032 =  + CopterBodyJ32;
           
           %DOF1 - Mirror Control;
           DOF1J = MirrorBracketJ + MirrorJ;
           
           SysJ0 = EncoderJ + DOF0J;
           SysJ1 = EncoderJ + DOF1J;
            
%%     Transfer Functions      
        %% Motor/Mechanical Dynamics Model
            % MechX:             1
            %                ---------
            %                  Js + B
            % Torque/Velocity Transfer (No spring in model)


            Mech0n = [1];
            Mech0d = [M0(RotJ) + SysJ0, M0(DynFric)];

            Mech1n = [1];
            Mech1d = [M3(RotJ) + SysJ1, M3(DynFric)];

            TCon0 = M0(TorqueK);
            TCon1 = M3(TorqueK);

            SpdCon0 = M0(SpdK);
            SpdCon1 = M3(SpdK);

            % ElecX:             1
            %                ---------
            %                 Ls + R
            % Voltage/Current Transfer Function

            Elec0n = [1];
            Elec0d = [M0(TermL),M0(TermR)];
            Elec1n = [1];
            Elec1d = [M3(TermL),M3(TermR)];







