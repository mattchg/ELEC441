%% Curve Fitting and Linearizing Around 14,000 RPM
PropellerSpecs;
RPM = 14000;
RadSec_SS = RPM*RadPSecPerRPM;
w = (RPM-3000:100:RPM+3000)*RadPSecPerRPM;

%% Friction Coefficient
%fittedmodel(x) = p1*x^2 + p2*x + p3;
cftool(PropTestSpeed,PropTestTorque) 
%%
LinearizedFrictionSlope = 2*fittedmodel1.p1*(RadSec_SS);
f_SS = fittedmodel1(RadSec_SS);

L = f_SS + LinearizedFrictionSlope*(w - RadSec_SS);

nL = fittedmodel1(w);

LinearizedB = fittedmodel1(RadSec_SS)/RadSec_SS;

hold on
plot(w/RadPSecPerRPM,L)


%% Speed/Thrust Gain
cftool(PropTestSpeed,PropTestThrust) 
%%
linearizedThrustSlope = 2*fittedmodel.p1*(RadSec_SS);
f_SS = fittedmodel(RadSec_SS);
L = f_SS + linearizedThrustSlope*(w - RadSec_SS);
nL = fittedmodel(w);

plot(w/RadPSecPerRPM,nL/9.81)
hold on
plot(w/RadPSecPerRPM,L/9.81)



