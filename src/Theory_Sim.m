%% Theory_Sim.m
s = tf('s');
m = 0.095; % Mass of ball kg
R = 0.0142875; % Radius of ball m
J = (2/5)*m*R^2; % Moment of inertia kg*m^2 (Solid Ball)
g = -9.81; % Gravity m/s^2

G = (-m*g*((2*pi)/360)*(100/1))/(((J/(R^2))+m)*s^2); % Transfer Function
[GNum,GDen] = tfdata(G,'v');
%% CL Proportional + Derivative (Simulink)
Kp = 1;  %Proportional Gain 
Kd = 2;  %Derivative Gain
IP = 0;
TP = 20;
Time = 5;

sim('FP_Sim')

figure
subplot(2,1,1)
plot(Ball_Out.time,Ball_Out.data(1:end,2))
subplot(2,1,2)
plot(Ball_Out.time,Ball_Out.data(1:end,1))