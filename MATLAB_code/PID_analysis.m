%% No Control
kp = 200;
ki = 300;
kd = 250;
J = 0.0124;
b = 0.005; % small for low friction motor
K = 0.25;
R = 24;
L = 0.1;
s = tf('s');
P = K/((J*s+b)*(L*s+R)+K^2) % transfer function of DC motor from MATLAB
T = feedback(P,1);
t = 0:0.01:5;
figure
step(T, t)
title('DC Motor Step Response with No Control');
legend('sse = 0.3697, over = 0%');
legend('Location','southeast')
info = stepinfo(P)
y = step(P);
sserror=abs(1-y(end))

%% P Control
kp1 = 100;
C1 = pid(kp1)
T1 = feedback(C1*P,1)

kp2 = 1000;
C2 = pid(kp2)
T2 = feedback(C2*P,1)

kp3 = 4000;
C3 = pid(kp3)
T3 = feedback(C3*P,1)

t = 0:0.00001:0.1;

figure
% subplot(3,1,1)
step(T1,t, 'b')
hold on
% subplot(3,1,2)
step(T2,t, 'r')

% subplot(3,1,3)
stepplot(T3,t, 'g')
legend('kp = 100,   sse = 0.0072,        over = 1%', 'kp = 1000, sse = 7.2947e-04, over = 42%', 'kp = 4000, sse = 1.8247e-04, over = 65%')
hold off

info = stepinfo(T1);
info = stepinfo(T2);
info = stepinfo(T3);
title('DC Motor Step Response with P Control');
y1 = step(T1,t);
sserror=abs(1-y1(end))
y2 = step(T2,t);
sserror=abs(1-y2(end))
y3 = step(T3,t);
sserror=abs(1-y3(end))
%% PD Control
kp = 1000;

kd1 = 10;
C1 = pid(kp, 0, kd1)
T1 = feedback(C1*P,1)

kd2 = 50;
C2 = pid(kp, 0, kd2)
T2 = feedback(C2*P,1)

kd3 = 100;
C3 = pid(kp, 0, kd3)
T3 = feedback(C3*P,1)

t = 0:0.0001:0.1;

figure
% subplot(3,1,1)
step(T1,t, 'b')
hold on
% subplot(3,1,2)
step(T2,t, 'r')

% subplot(3,1,3)
stepplot(T3,t, 'g')
legend('kd = 10,     sse = 7.3573e-04, over = 0%', 'kd = 50,   sse = 0.0037, over = 0%', 'kd = 100, sse = 0.0047, over = 0%')
hold off

info = stepinfo(T1);
info = stepinfo(T2);
info = stepinfo(T3);
title('DC Motor Step Response with PD Control');
y1 = step(T1,t);
sserror=abs(1-y1(end))
y2 = step(T2,t);
sserror=abs(1-y2(end))
y3 = step(T3,t);
sserror=abs(1-y3(end))

%% PI Control
kp = 100;
ki1 = 10;
C1 = pid(kp, ki1)
T1 = feedback(C1*P,1)

ki2 = 1400;
C2 = pid(kp, ki2)
T2 = feedback(C2*P,1)

ki3 = 3000;
C3 = pid(kp, ki3)
T3 = feedback(C3*P,1)
C = pid(kp,ki)
T = feedback(C*P,1)

t = 0:0.001:0.8;
figure
% subplot(3,1,1)
step(T1,t, 'b')
hold on
% subplot(3,1,2)
step(T2,t, 'r')

% subplot(3,1,3)
stepplot(T3,t, 'g')
legend('ki = 10,      sse = 0.0056,          over = 0.1%', 'ki = 1400,  sse = 3.1933e-07,   over = 14%', 'ki = 3000,  sse = 1.1102e-16,   over = 26%')
hold off

info = stepinfo(T1)
info = stepinfo(T2)
info = stepinfo(T3)
title('DC Motor Step Response with PI Control');
y1 = step(T1,t);
sserror=abs(1-y1(end));
y2 = step(T2,t);
sserror=abs(1-y2(end));
y3 = step(T3,t);
sserror=abs(1-y3(end));

%% PID Control
kp = 6000;
ki = 3600;
kd = 100;

C = pid(kp,ki,kd)
T = feedback(C*P,1);

t = 0:0.01:.2;
step(T,t)
S = stepinfo(P)
title('DC Motor Step Response with PID Control');
[y,m] = step(T,t);
sserror=abs(1-y(end))
legend(['kp = 6000, ki = 3600, kd = 100' newline 'sse = 1.4375e-06, over = 0%']);