final_value = T(end);
tolerance = 0.02 * final_value;
idx = find(abs(T - final_value) > tolerance);
settling_time = t(max(idx));
fprintf('Settling Time: %.2f seconds\n', settling_time);

overshoot = max(T) - final_value;
fprintf('Overshoot: %.2f°C\n', overshoot);

steady_state_error = abs(300 - final_value);  % Assuming 300°C setpoint
fprintf('Steady-State Error: %.2f°C\n', steady_state_error);