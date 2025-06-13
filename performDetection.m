clc;
clear;
close all;

mf1=2;           %We have identified a sinusoidal message 1 signal with a frequency of 2 Hz.
mf2=4;           %We have identified a sinusoidal message 2 signal with a frequency of 4 Hz.

fs = 100;           %We defined the sampling frequency value given to us in subtask 1 as 100 Hz as requested.
fc = 20;            %As requested from us, we defined the carrier frequency value as 20 Hz.
t = (0:0.01:50);    %In this line, we have defined the time vector in this way so that the intervals of the values that will occur between 0 and 50 seconds requested from us can be 0.01.

m1 = sin(2*pi*mf1*t);   %In this line, we produced a sinusoidal message wave with a frequency value of 2 Hz, which we defined for the variable m1.
m2 = sin(2*pi*mf2*t);   %In this line, we produced a sinusoidal message wave with a frequency value of 4 Hz, which we defined for the variable m2.

s1 = amDSBSC(m1, fc, fs);   %We modulated the m1 signal using matlab's ammod function and defined the resulting value as the s1 signal.
s2 = amDSBSC(m2, fc, fs);   %We modulated the m2 signal using matlab's ammod function and defined the resulting value as the s2 signal.

z1 = amdemod(s1,fc,fs);     %We demodulated the s1 signal using matlab's amdemod function and defined the resulting value as the z1 signal.
z2 = amdemod(s2,fc,fs);     %We demodulated the s1 signal using matlab's amdemod function and defined the resulting value as the z2 signal.

AmCoDetdemodsignal1 = amCoDet(s1, fc, fs);   %We demodulated the s1 signal with the function we defined in our amCoDet file without using the built-in function of Matlab. We defined the result we obtained to the Amdemodsignal1 variable.
AmCoDetdemodsignal2 = amCoDet(s2, fc, fs);   %We demodulated the s2 signal with the function we defined in our amCoDet file without using the built-in function of Matlab. We defined the result we obtained to the Amdemodsignal2 variable.

figure(1)
f = gcf;
f.Color = [0.7 0.8 0.9];
subplot(2,2,1)  %We had plotted the original m1 message and demodulated signal z1, and with the 'xlim' command, we were able to set the time between the value 0 and 2.
grid on
hold on
plot(t,m1,'--r','linewidth',2)
plot(t,z1,'b')
xlim([0 2])
legend ('Message signal 1','Demodulated signal 1')
xlabel ('Time','fontsize',10), ylabel('Amplitude','fontsize',10)
title ('Signal comparison of M1 and Z1')

%%%%%%%%%
subplot(2,2,2); %We had plotted the original m2 message and demodulated signal z2, and with the 'xlim' command, we were able to set the time between the value 0 and 2.
grid on
hold on
plot(t,m2,'--r','linewidth',2)
plot(t,z2,'b')
xlim([0 2])
legend ('Message signal 2','Demodulated signal 2')
xlabel ('Time','fontsize',10), ylabel('Amplitude','fontsize',10)
title ('Signal comparison of M2 and Z2')

%%%%%%%%%
subplot(2,2,3)  %We had plotted the original m1 message and demodulated signal Amdemodulatedsignal1 we obtained from the function we created ourselves, and with the 'xlim' command, we were able to set the time between the value 0 and 2.
grid on
hold on
plot(t,z1,'--r','linewidth',2)
plot(t,AmCoDetdemodsignal1,'*--b','linewidth',0.5)
xlim([0 2])
xlabel ('Time','fontsize',10), ylabel('Amplitude','fontsize',10)
legend ('amdemod for m1','AmCoDetdemodsignal 1')
title ('Signal comparison of amdemod and AmCoDet for signal m1')

%%%%%%%%
subplot(2,2,4); %We had plotted the original m2 message and demodulated signal Amdemodulatedsignal2 we obtained from the function we created ourselves, and with the 'xlim' command, we were able to set the time between the value 0 and 2.
grid on
hold on
plot(t,z2,'--r','linewidth',2)
plot(t,AmCoDetdemodsignal2,'*--b','linewidth',0.5)
xlim([0 2])
xlabel ('Time','fontsize',10), ylabel('Amplitude','fontsize',10)
legend ('amdemod for m2','AmCoDetdemodsignal 2')
title ('Signal comparison of amdemod and AmCoDet for signal m2')
