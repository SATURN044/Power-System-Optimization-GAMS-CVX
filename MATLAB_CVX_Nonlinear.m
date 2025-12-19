%% Power System Nonlinear Optimization using CVX
% Solves Economic Dispatch with Quadratic Cost Functions
clear; clc;

% Input Data
b = [0.5; 0.6; 3]; 
n = 7;
d = [1.26; 1.26; 2.50; 2.50; 1.30; 1.30; 1.40; 2.85; 0.90; 0.85];

% Constraint Matrices
A = [1 1 0 0 -10 5 5; 0 0 1 0 5 -15 10; 0 0 0 1 5 10 -15];
G = [0 0 0 0 5 -5 0; 0 0 0 0 -5 5 0; 0 0 0 0 5 0 -5; 0 0 0 0 -5 0 5; 
     0 0 0 0 0 10 -10; 0 0 0 0 0 -10 10; 
     1 0 0 0 0 0 0; 0 1 0 0 0 0 0; 0 0 1 0 0 0 0; 0 0 0 1 0 0 0];

cvx_begin
    variable x(n)
    dual variables y z
    
    % Nonlinear Objective Function (Quadratic Cost)
    cost = (100 + 10*x(1) + 0.01*x(1)^2) + ...
           (200 + 20*x(2) + 0.02*x(2)^2) + ...
           (140 + 14*x(3) + 0.01*x(3)^2) + ...
           (150 + 15*x(4) + 0.02*x(4)^2);
    
    minimize(cost)
    
    subject to
        y : A * x == b;
        z : G * x <= d;
        x(1:4) >= 0;
cvx_end

% Output Results
fprintf('Optimal Cost: %.2f\n', cvx_optval);
disp('Variable values (x):');
disp(x);
