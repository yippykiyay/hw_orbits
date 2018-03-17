% Projectile Motion:
% Program to compute the 2D projectile of a baseball using
% the Euler, Euler-Cromer, and Midpoint methods.
%
clear, clc
% Initial conditions
x0=[0 0];
theta=45*pi/180;
v0=100;
v0=[v0*cos(theta) v0*sin(theta)];
x=x0;
v=v0;
state=[x v];
time=0;
method=menu('Numerical method','Midpoint','Runge Kutta','Adaptive Runge Kutta');
% Other parameters
grav=[0,-9.8];         % acceleration of gravity
cd = 0.35;             % drag coefficient
r  = .037;             % radius of baseball
area = pi*r*r;         % frontal area of baseball
mass = 0.145;          % mass of baseball
rho = 1.2;             % air density
tau=0.1;               % time step size
dat=[time x v];        % solution matrix
dragconst=0.5*rho*area/mass;
adaptErr=5e-4;
%
counter = 0;
while(x(2)>=0 & counter<10000)         % repeat until the projectile hits the ground
    counter = counter + 1;
    if(method==1)      % Midpoint
        accel = grav-dragconst*v*norm(v);
        vnew = v + tau*accel;
        x = x + tau*0.5*(v+vnew);
        v = vnew;
        time = time + tau;
    elseif(method==2)  % Runge Kutta
        % Call rk4
        x = [state(1) state(2)];   % 4th order Runge-Kutta
        v = [state(3) state(4)];
        time = time + tau; 
    else               % Adaptive Runge Kutta
        % Call rka
        x = [state(1) state(2)];   % 4th order Runge-Kutta
        v = [state(3) state(4)];
    end
    dat=[dat;time x v];
end
%
if(method==1)
    col='k-';
elseif(method==2)
    col='bp';
else
    col='rd';
end
subplot(221)
plot(dat(:,1),dat(:,4),col)
xlabel('time (sec)'), ylabel('v_x (m/s)')
hold on
subplot(222)
plot(dat(:,1),dat(:,5),col)
xlabel('time (sec)'), ylabel('v_y (m/s)')
hold on
subplot(212)
plot(dat(:,2),dat(:,3),col)
xlabel('x (m)'), ylabel('y (m)')
hold on