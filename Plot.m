t = out.temp.time;
T = out.temp.signals.values;
e = out.error.signals.values;
p = out.power.signals.values;

figure;
subplot(3,1,1),
plot(t, T, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Furnace Temperature');
grid on;

subplot(3,1,2);
plot(t, e, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Error (°C)');
title('Temperature Error');
grid on;

subplot(3,1,3);
plot(t, p, 'g', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Heating Power');
title('PID Controller Output');
grid on;