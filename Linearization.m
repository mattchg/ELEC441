%% Curve Fitting and Linearizing Around 14,000 RPM
PropellerSpecs;
w = (10000:100:20000)*RadPSecPerRPM;
RadSec_SS = 14000*RadPSecPerRPM;

%% Friction Coefficient
%fittedmodel(x) = p1*x^2 + p2*x + p3

cftool(PropTestSpeed,PropTestTorque) 
%%
linearizedFrictionCoef = 2*fittedmodel.p1*(RadSec_SS) + fittedmodel.p2;

nL = fittedmodel(w);
B = fittedmodel(RadSec_SS)-(linearizedFrictionCoef*RadSec_SS);
L = linearizedFrictionCoef*w + B;

plot(w/RadPSecPerRPM,nL)
hold on
plot(w/RadPSecPerRPM,L)

%% Speed/Thrust Gain
%cftool(PropTestSpeed,PropTestThrust) 
%%
linearizedThrustGain = 2*fittedmodel.p1*(RadSec_SS) + fittedmodel.p2;

nL = fittedmodel(w);
ThrustIntercept = fittedmodel(RadSec_SS)-(linearizedThrustGain*RadSec_SS);
L = linearizedThrustGain*w + ThrustIntercept;

plot(w/RadPSecPerRPM,nL/9.81)
hold on
plot(w/RadPSecPerRPM,L/9.81)



