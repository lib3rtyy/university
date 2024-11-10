syms t s;
u(t)=(heaviside(t));
x(t)=3.*sin(t+(5*pi)/3).*u(t);
y(s)=laplace(x(t),s);

subplot(411);
ezplot(t,[0,100],'r');grid on;

x2(s)=4/(4*s^5+(5-4)*s^4+(1-4)*s^3+s^2;
x2(t)=ilaplace(x2(s));
subplot(412);
ezplot(x2(t),[0,100],'bl'); grid on;
