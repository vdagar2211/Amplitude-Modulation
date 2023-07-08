clc
clear all
close all
%taking voice signal
[m,fs]=audioread('fivewo.wav');
m=m';
t=linspace(0,(length(m))/(fs),length(m));
subplot(4,1,1);
plot(t,m);
title("time Domain of Audio Signal");

%Am=max(m);
%Amin=min(m);

N=length(m);
M = abs(fftshift(fft(m,N)));
f = linspace(-fs/2,fs/2,N);
subplot(4,1,2);
plot(f,M/N);
title("Frequency Domain of Audio Signal");

%{%taking carrier signal
fc=40000;
u=2;
c=cos(2*pi*fc*t);
subplot(4,1,3);
plot(t,c)
title("time Domain of carrier Signal");


C = abs(fftshift(fft(c,N)));
subplot(4,1,4);
plot(f,C/N);
title("Frequency Domain of carrier Signal");


%modulating signal
x=(1+(u*m)).*c;
figure(2)
subplot(2,1,1);
plot(t,x)
title("time Domain of modulated Signal");


X = abs(fftshift(fft(x,N)));
f = linspace(-fs/2,fs/2,N);
subplot(2,1,2);
%figure(2)
plot(f,X/N);
title("Frequency Domain of modulated Signal");
ylim([0 0.01])
