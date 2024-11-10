w=1.25*pi;
t=(-5)*pi:pi/100:5*pi;
x=sin(pi*t).^2.*heaviside((-pi)-t)+cos(w*t).^2.*heaviside(t-w)+sin(w*t).*cos(pi*t).*(heaviside(t+pi)-heaviside(t-w));
x1=sin(pi*(t-w)).^2.*heaviside((-pi)-(t-w))+cos(w*(t-w)).^2.*heaviside((t-w)-w)+sin(w*(t-w)).*cos(pi*(t-w)).*(heaviside((t-w)+pi)-heaviside((t-w)-w));
x2=sin(pi*(10*t)).^2.*heaviside((-pi)-(10*t))+cos(w*(10*t)).^2.*heaviside((10*t)-w)+sin(w*(10*t)).*cos(pi*(10*t)).*(heaviside((10*t)+pi)-heaviside((10*t)-w));
x3=1.25-x;

figure(1);
subplot(411);plot(t,x,'r');grid on;title('x(t)');hold on
subplot(412);plot(t,x1,'g');grid on;title('x(t-kπ)');
subplot(413);plot(t,x2,'k');grid on;title('x(10t)');
subplot(414);plot(t,x3,'bl');grid on; title('k-mx(t)');