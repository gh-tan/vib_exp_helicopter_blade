close all; clear; clc

%% NOTE: all files used are from 2nd trial <<<<<

%% week 3 - out of plane bending
w3_out = csvread('ch_1(root)_ch2(tip)_2nd.csv',21,0,[21 0 171 3]); %<< switch the file name
freq_out = w3_out(:,1);
ch1_out = w3_out(:,2);
ch2_out = w3_out(:,3);
% G_out = ch2_out - ch1_out;
G_out = ch2_out ./ ch1_out;
Gout_angle = w3_out(:,4);

% modeling
w2_out=2*pi*87.86;
w1_out=2*pi*84.67;
w3_out=2*pi*138.2;
beta1_out=0.02;
beta2_out=0.04;
beta3_out=0.02;
K_out=1;

num_out=[1 2*beta1_out*w1_out w1_out^2];
den_out=conv([1 2*beta2_out*w2_out w2_out^2],[1 2*beta3_out*w3_out w3_out^2]);
Hij_out=K_out*w2_out^2*w3_out^2/w1_out^2*tf(num_out,den_out);

myf_out=logspace(log10(50),log10(200),500); % range set from 5hz to 50 hz for 500 points
[m_out,p_out]=bode(Hij_out,2*pi*myf_out); % 2*pi*myf = 2*pi*freq, here m = mag, p = phase
figure(1)
title('Measured & Modeled frequency response for out-of-plane bending')
subplot(2,1,1)
% semilogx(freq_out,20*log10(abs(G_out)))
semilogx(freq_out,20*(abs(G_out)))
hold on
% semilogx(myf_out,20*log10(abs(squeeze(m_out))))
grid on
title('Measured & Modeled frequency response for out-of-plane bending')
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Magnitude (dB)')
subplot(2,1,2)
semilogx(freq_out,Gout_angle) % just plot the data w/o further calculation
hold on
% semilogx(myf_out,squeeze(p_out))
grid on
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Phase(degree)')


% plot raw data
figure(2)
subplot(2,1,1)
semilogx(freq_out,ch1_out)
hold on
semilogx(freq_out,ch2_out)
legend('ch1','ch2')
grid on
title('raw data for out-of-plane bending')
subplot(2,1,2)
semilogx(freq_out,Gout_angle)
grid on

%% week 3 - in plane bending
w3_out = csvread('ch1(root)_ch2(tip)_2nd.csv',21,0,[21 0 171 3]); %<< switch the file name
freq_out = w3_out(:,1);
ch1_out = w3_out(:,2);
ch2_out = w3_out(:,3);
G_out = ch2_out - ch1_out;
Gout_angle = w3_out(:,4);

% modeling
w2_out=2*pi*87.86;
w1_out=2*pi*84.67;
w3_out=2*pi*138.2;
beta1_out=0.02;
beta2_out=0.04;
beta3_out=0.02;
K_out=10;

num_out=[1 2*beta1_out*w1_out w1_out^2];
den_out=conv([1 2*beta2_out*w2_out w2_out^2],[1 2*beta3_out*w3_out w3_out^2]);
Hij_out=K_out*w2_out^2*w3_out^2/w1_out^2*tf(num_out,den_out);

myf_out=logspace(log10(50),log10(200),500); % range set from 5hz to 50 hz for 500 points
[m_out,p_out]=bode(Hij_out,2*pi*myf_out); % 2*pi*myf = 2*pi*freq, here m = mag, p = phase
figure(3)
title('Measured & Modeled frequency response for in plane bending')
subplot(2,1,1)
semilogx(freq_out,20*log10(abs(G_out)))
hold on
% semilogx(myf_out,20*log10(abs(squeeze(m_out))))
grid on
title('Measured & Modeled frequency response for in plane bending')
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Magnitude (dB)')
subplot(2,1,2)
semilogx(freq_out,Gout_angle) % just plot the data w/o further calculation
hold on
% semilogx(myf_out,squeeze(p_out))
grid on
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Phase(degree)')


% plot raw data
figure(4)
subplot(2,1,1)
semilogx(freq_out,ch1_out)
hold on
semilogx(freq_out,ch2_out)
legend('ch1','ch2')
grid on
title('raw data for in-plane bending')
subplot(2,1,2)
semilogx(freq_out,Gout_angle)
grid on


%% week 3 - torsion bending
w3_out = csvread('45degrees_2nd.csv',21,0,[21 0 171 3]); %<< switch the file name
freq_out = w3_out(:,1);
ch1_out = w3_out(:,2);
ch2_out = w3_out(:,3);
G_out = ch2_out - ch1_out;
Gout_angle = w3_out(:,4);

% modeling
w2_out=2*pi*87.86;
w1_out=2*pi*84.67;
w3_out=2*pi*138.2;
beta1_out=0.02;
beta2_out=0.04;
beta3_out=0.02;
K_out=10;

num_out=[1 2*beta1_out*w1_out w1_out^2];
den_out=conv([1 2*beta2_out*w2_out w2_out^2],[1 2*beta3_out*w3_out w3_out^2]);
Hij_out=K_out*w2_out^2*w3_out^2/w1_out^2*tf(num_out,den_out);

myf_out=logspace(log10(50),log10(200),500); % range set from 5hz to 50 hz for 500 points
[m_out,p_out]=bode(Hij_out,2*pi*myf_out); % 2*pi*myf = 2*pi*freq, here m = mag, p = phase
figure(5)
title('Measured & Modeled frequency response for torsion plane bending')
subplot(2,1,1)
semilogx(freq_out,20*log10(abs(G_out)))
hold on
% semilogx(myf_out,20*log10(abs(squeeze(m_out))))
grid on
title('Measured & Modeled frequency response for torsion plane bending')
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Magnitude (dB)')
subplot(2,1,2)
semilogx(freq_out,Gout_angle) % just plot the data w/o further calculation
hold on
% semilogx(myf_out,squeeze(p_out))
grid on
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Phase(degree)')


% plot raw data
figure(6)
subplot(2,1,1)
semilogx(freq_out,ch1_out)
hold on
semilogx(freq_out,ch2_out)
legend('ch1','ch2')
grid on
title('raw data for torsion bending')
subplot(2,1,2)
semilogx(freq_out,Gout_angle)
grid on