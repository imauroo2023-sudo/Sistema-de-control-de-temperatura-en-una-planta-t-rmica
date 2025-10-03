%% Control PID Cohen–Coon
Kp = 23.1;
Ti = 70.8;
Td = 10.8;

% Controlador PID (forma paralela)
Ccc = pid(Kp, Kp/Ti, Kp*Td);

% Sistema en lazo cerrado
Tcc = feedback(Ccc*G, 1);

% Simulación para set point de 40 °C
SP = 40; % °C
y0 = 25; % °C inicial
u_step = SP - y0;

t = 0:1:2000;
[y,t] = step(u_step*Tcc, t);

% Ajustar al nivel inicial
y = y + y0;

figure;
plot(t,y,'g','LineWidth',2);
xlabel('Tiempo (s)'); ylabel('Temperatura (°C)');
title('Respuesta con PID Cohen–Coon (SP=40 °C)');
grid on;
