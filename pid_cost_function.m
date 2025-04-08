function cost = pid_cost_function_mse(pid_gains)
    Kp = pid_gains(1);
    Ki = pid_gains(2);
    Kd = pid_gains(3);

    assignin('base', 'Kp', Kp);
    assignin('base', 'Ki', Ki);
    assignin('base', 'Kd', Kd);

    simOut = sim("AI_based_PID", 'ReturnWorkspaceOutputs', 'on');

    T = simOut.get('temp').signals.values;
    t = simOut.get('temp').time;

    T_setpoint = 300;

    e = T - T_setpoint;

    cost = mean((e).^2);

end


% Define optimization problem
nvars = 3; % Number of variables (Kp, Ki, Kd)
lb = [0, 0, 0]; % Lower bounds for PID gains (you can adjust these)
ub = [100, 10, 1]; % Upper bounds for PID gains (you can adjust these)

% Set up the options for the GA
options = optimoptions('ga', 'MaxGenerations', 100, 'PopulationSize', 50, ...
    'PlotFcn', @gaplotbestf, 'Display', 'iter'); % Display iteration info

% Run the genetic algorithm
[optimal_pid, optimal_cost] = ga(@pid_cost_function_mse, nvars, [], [], [], [], lb, ub, [], options);

% Display the optimal PID gains and the corresponding cost
disp('Optimal PID Gains:');
disp(optimal_pid);
disp('Optimal Cost:');
disp(optimal_cost);
