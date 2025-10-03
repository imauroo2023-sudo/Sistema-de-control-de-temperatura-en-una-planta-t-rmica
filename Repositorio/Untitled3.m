%% Control PID Ziegler–Nichols
Kp = 20;
Ti = 60;
Td = 15;

% Controlador PID (forma paralela)
Czn = pid(Kp, Kp/Ti, Kp*Td);

% Sistema en lazo cerrado
Tzn = feedback(Czn*G, 1);

% Simulación para set point de 40 °C
SP = 40; % °C
y0 = 25; % °C inicial
u_step = SP - y0; % escalón equivalente en lazo cerrado

t = 0:1:2000;
[y,t] = step(u_step*Tzn, t);

% Ajustar al nivel inicial
y = y + y0;

figure;
plot(t,y,'r','LineWidth',2);
xlabel('Tiempo (s)'); ylabel('Temperatura (°C)');
title('Respuesta con PID Ziegler–Nichols (SP=40 °C)');
grid on;
