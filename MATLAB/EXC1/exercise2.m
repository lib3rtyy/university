t=-5*pi:pi/100:5*pi;
x1=exp(-1.25*t).*(heaviside(t+1)-heaviside(t));
h1=1.25*heaviside(t);
y1=-exp(-1.25)+1;

figure (1);
subplot(311);plot(x1,'bl');grid on;
subplot(312);plot(h1,'r');grid on;
subplot(313);plot(y1,'g');grid on;

t=-5*pi:pi/100:5*pi;
x2=heaviside(t+1)-heaviside(t-1.25);
h2=exp(-t).^2;
y2=sqrt(pi).*(t+1).*(t-1.25);

figure(2);
subplot(311);plot(x2,'bl');grid on;
subplot(312);plot(h2,'r');grid on;
subplot(313);plot(y2,'g');grid on;

t=-5*pi:pi/100:5*pi;
x3=heaviside(t+2)-heaviside(t-1);
h3=3;
y3=0;

figure(3);
subplot(311);plot(x3,'bl');grid on;
subplot(312);plot(h3,'r');grid on;
subplot(313);plot(y3,'g');grid on;

t=-5*pi:pi/100:5*pi;
x4=1.25;
h4=sin(1.25*t);
y4=(1/2.5).*(-cos(2-t+pi)+cos(2-t-pi));

figure(4);
subplot(311);plot(x4,'bl');grid on;
subplot(312);plot(h4,'r');grid on;
subplot(313);plot(y4,'g');grid on;

t=-5*pi:pi/100:5*pi;
x5=1.25*heaviside(t+1);
h5=exp(-t).*heaviside(t-1.25);
y5=1.25.*(exp(-1.25)-exp(-t-1));

figure(5);
subplot(311);plot(x5,'bl');grid on;
subplot(312);plot(h5,'r');grid on;
subplot(313);plot(y5,'g');grid on;











