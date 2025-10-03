%% Modelo de la planta (FOPDT)
K = 0.4;      % Ganancia
L = 30;       % Tiempo muerto (s)
T = 200;      % Constante de tiempo (s)

% Aproximaci�n de Pad� para el retardo
n = 1; % orden de Pad�
[num_delay, den_delay] = pade(L, n);

% Planta sin retardo
Gs = tf(K, [T 1]);

% Planta completa
G = Gs * tf(num_delay, den_delay);

% Mostrar planta
disp('Modelo de la planta con Pad�:')
G

% Respuesta al escal�n de 20% PWM
u = 0.2; % magnitud del escal�n
t = 0:1:1500;
[y,t] = step(u*G, t);

% Graficar
figure;
plot(t,y + 25,'b','LineWidth',2);
xlabel('Tiempo (s)'); ylabel('Temperatura (�C)');
title('Respuesta de la planta al escal�n de 20% PWM');
grid on;
