clc
clear all
close all
%taking voice signal
[m,fs]=audioread('fivewo.wav');
m=m';
t=linspace(0,(length(m))/(fs),length(m));

Am=max(m);
Amin=min(m);

%taking carrier signal
fc=40000;
u=0.5;
Ac=Am/u;
c=Ac*cos(2*pi*fc*t);

%modulating signal
x=(1+(m/Ac)).*c;
subplot(6,1,5);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%demodulating signal using envelope detector

%h=(pi*t).^(-1);
%x_h=conv(x,c,'same');
%x_ce=x+1i*(x_h);
%x_t=sqrt((x.*x)-(x_h.*x_h));
%e=abs(x_ce);


e=abs(x./c);
%subplot(4,1,4);
%plot(t,e,"k")

%e = hilbert(x);
%e = abs(e);
soundsc(e,fs);
subplot(2,1,1);

plot(t,e)
title("time Domain of demodulated Signal");


N=length(m);
E = abs(fftshift(fft(e,N)));
f = linspace(-fs/2,fs/2,N);
subplot(2,1,2);
plot(f,E/N);
title("Frequency Domain of demodulated Signal");
ylim([0 0.01])

%e1=abs((1+(m)).*u);
%e=lowpass(e1,4000,fs);
%find xt,xhat t and magnitude



%&d=x+
%u=rectpuls(t,0.000025);
%e1=abs(x);
%e2=lowpass(e1,4000,fs);
%e=lowpass(e1,4000,fs);

%plot(t,x)
%hold on
%plot(t,e,"k")