clear all;
clc;
printf('Newton-cotes method for numerical integration\n');

#integrand 
function [result] = f(x)
	result = exp(x) * cos(x);
endfunction

#limits of integration;
a = 1;
b = 4;
n = input('Enter the degree of the interpolating polynomial :');
h = (b - a) /n;

lag_dat = [];
#lag_dat = [lag_dat; [a, f(a)]];
for i = 0:n
	x = a + i * h;
	lag_dat = [lag_dat; [x, f(x)]];
endfor
lag_dat;

#lagrange interpolating polynomial 
n_row = rows(lag_dat);
L = [];
for i = 1:n_row
	l = [1];
	D = 1;
	for j = 1:n_row
		if j ~= i
			l = conv(l, [1, -lag_dat(j,1)]);
			D = D * (lag_dat(i,1) - lag_dat(j,1));
		endif
	end
	L = [L;l/D];
end

#weight function
w = [];
sum = 0;
for i = 1:n_row
	q = polyint(L(i,:));
	I = polyval(q,b) - polyval(q, a);
	w = [w;I];
end
for i = 1:n_row
	sum = sum + w(i) * f(lag_dat(i,1));
endfor
sum;





