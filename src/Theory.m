%% Theory.m
s = tf('s');
m = 0.095; % Mass of ball kg
R = 0.0142875; % Radius of ball m
J = (2/5)*m*R^2; % Moment of inertia kg*m^2 (Solid Ball)
g = -9.81; % Gravity m/s^2

G = (-m*g*((2*pi)/360)*(100/1))/(((J/(R^2))+m)*s^2);

%% OL
figure
step(20*G)
[y,t] = step(20*G);


%% CL Proportional
figure
K = 0.5;
CL = (K*G)/(1+K*G);
step(20*CL)
[y,t] = step(20*CL);

%% CL Proporitonal + D
figure
Kp = 1;
Kd = 2;
K = (Kp+Kd*s);
CL = (K*G)/(1+K*G);
step(20*CL)
[y,t] = step(20*CL);

%% Calculate real system characteristics
%Values in arrays were pasted from excel
Real = [];
Info = stepinfo(Real(1:end,2),Real(1:end,1));
