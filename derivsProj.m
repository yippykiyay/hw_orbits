function deriv = derivsProj(s,t,params)
%  Returns right-hand side of Kepler ODE; used by Runge-Kutta routines
%  Inputs
%    s      State vector [r(1) r(2) v(1) v(2)]
%    t      Time (not used)
%    params Parameters needed for calculating acceleration (maybe drag, etc)
%  Output
%    deriv  Derivatives [dr(1)/dt dr(2)/dt dv(1)/dt dv(2)/dt]

%Extract parameters from input


% Compute acceleration
x = [s(1) s(2)];  % Unravel the vector s into position and velocity
v = [s(3) s(4)];

% Calculate derivatives


% Return derivatives [dr(1)/dt dr(2)/dt dv(1)/dt dv(2)/dt]
deriv = [v(1) v(2) accel(1) accel(2)];

return;
