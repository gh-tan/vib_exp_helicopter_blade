close all; clear; clc

%% week 2, 1-2 floor
w2_12_1 = csvread('first_second_1.csv',21,0,[21 0 171 3]);
w2_12_2 = csvread('1-2-2nd data.csv',21,0,[21 0 171 3]); %<< switch the file name
w2_12_3 = csvread('1-2-3rd data.csv',21,0,[21 0 171 3]);
w2_12_4 = csvread('1-2-4th data.csv',21,0,[21 0 171 3]);
freq_12 = w2_12_2(:,1);
for i = 1:length(freq_12)
%     w2_12_ch1(i,:) = [w2_12_1(i,2) w2_12_2(i,2) w2_12_3(i,2) w2_12_4(i,2)];
%     w2_12_ch2(i,:) = [w2_12_1(i,3) w2_12_2(i,3) w2_12_3(i,3) w2_12_4(i,3)];
%     w2_12_angle(i,:) = [w2_12_1(i,4) w2_12_2(i,4) w2_12_3(i,4) w2_12_4(i,4)];
%     G12_(i,:) = w2_12_ch2(i,:) - w2_12_ch1(i,:)
%     G12_mean(i) = mean(G12_(i))
%     G12_std(i) = std(G12_(i))
% %     ch1_12(i) = mean(w2_12_ch1(i,:));
% %     ch2_12(i) = mean(w2_12_ch2(i,:));
%     G12_angle(i) = mean(w2_12_angle(i,:));
% %     std_ch1(i) = std(w2_12_ch1(i,:))
% %     std_ch2(i) = std(w2_12_ch2(i,:))
% %     G12_std(i) = std(std_ch2-std_ch1)
    ch1_12(i) = (w2_12_1(i,2)+w2_12_2(i,2)+w2_12_3(i,2)+w2_12_4(i,2))./4;
    ch2_12(i) = (w2_12_2(i,3)+w2_12_2(i,3)+w2_12_3(i,3)+w2_12_4(i,3))./4;
    G12_angle(i) = (w2_12_2(i,4)+w2_12_2(i,4)+w2_12_3(i,4)+w2_12_4(i,4))./4;
%     std()
end
ch1_12 = w2_12_2(:,2);
ch2_12 = w2_12_2(:,3);
% G12 = G12_mean(i);
G12 = ch2_12 - ch1_12;
% G12_angle = w2_12_2(:,4);
G12_angle;

%% modeling
w2_12=2*pi*8;
w1_12=2*pi*14.6;
w3_12=2*pi*24.3;
beta1_12=0.01;
beta2_12=0.01;
beta3_12=0.01;
K_12=1;

num_12=[1 2*beta1_12*w1_12 w1_12^2];
den_12=conv([1 2*beta2_12*w2_12 w2_12^2],[1 2*beta3_12*w3_12 w3_12^2]);
Hij_12=K_12*w2_12^2*w3_12^2/w1_12^2*tf(num_12,den_12);

myf_12=logspace(log10(5),log10(50),500); % range set from 5hz to 50 hz for 500 points
[m_12,p_12]=bode(Hij_12,2*pi*myf_12); % 2*pi*myf = 2*pi*freq, here m = mag, p = phase
figure(1)
title('Measured & Modeled frequency response for floor 1-2')
subplot(2,1,1)
semilogx(freq_12,20*log10(abs(G12)))
hold on
semilogx(myf_12,20*log10(abs(squeeze(m_12))))
grid on
title('Measured & Modeled frequency response for floor 1-2')
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Magnitude (dB)')
subplot(2,1,2)
% semilogx(freq_13,180/pi*unwrap(angle(G13_angle)))
semilogx(freq_12,G12_angle) % just plot the data w/o further calculation
hold on
semilogx(myf_12,squeeze(p_12))
grid on
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Phase(degree)')

%% week 2 1-3 floor 2nd trial
w2_13_2 = csvread('1-3-3rd data.csv',21,0,[21 0 171 3]); %<< switch the file name
freq_13 = w2_13_2(:,1);
ch1_13 = w2_13_2(:,2);
ch2_13 = w2_13_2(:,3);
G13 = ch2_13 - ch1_13;
G13_angle = w2_13_2(:,4);

% modeling

w2=2*pi*8.35; %resonance freq
w1=2*pi*30; % anti-resonance freq
w3=2*pi*24.5; % resonance freq
beta1=0.01; % parameter(damping) needs to be determined
beta2=0.01;
beta3=0.01;
K=1; % K = ??? 1?

num=[1 2*beta1*w1 w1^2]; % numerator
den=conv([1 2*beta2*w2 w2^2],[1 2*beta3*w3 w3^2]); % denominator
Hij=K*w2^2*w3^2/w1^2*tf(num,den); % model (transfer function between floors)

myf=logspace(log10(5),log10(50),500); % range set from 5hz to 50 hz for 500 points
[m,p]=bode(Hij,2*pi*myf); % 2*pi*myf = 2*pi*freq, here m = mag, p = phase
figure(2)
title('Measured & Modeled frequency response for floor 1-3')
subplot(2,1,1)
semilogx(freq_13,20*log10(abs(G13)))
hold on
semilogx(myf,20*log10(abs(squeeze(m))))
grid on
title('Measured & Modeled frequency response for floor 1-3')
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Magnitude (dB)')
subplot(2,1,2)
% semilogx(freq_13,180/pi*unwrap(angle(G13_angle)))
semilogx(freq_13,G13_angle) % just plot the data w/o further calculation
hold on
semilogx(myf,squeeze(p))
grid on
legend('Measured','Modeled','location','best')
xlabel('frequency(Hz)');ylabel('Phase(degree)')


