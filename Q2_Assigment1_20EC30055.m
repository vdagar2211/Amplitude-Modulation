clc
clear all
close all
%taking voice signal
[m,fs]=audioread('fivewo.wav');
m=m';
t=linspace(0,(length(m))/(fs),length(m));

%Am=max(m);
%Amin=min(m);

%taking carrier signal
fc=40000;
u=0.5;
%Ac=Am/u;
c=cos(2*pi*fc*t);

%modulating signal
x=(1+(m*u)).*c;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%demodulating signal using coharent demodulation
y1=x.*(c);
y=lowpass(y1,5000,fs);
soundsc(y,fs)
subplot(2,1,1);
plot(t,y)
title("time Domain of demodulated Signal");


N=length(m);
Y = abs(fftshift(fft(y,N)));
f = linspace(-fs/2,fs/2,N);
subplot(2,1,2);
plot(f,Y/N);
title("Frequency Domain of demodulated Signal");
ylim([0 0.01])

