clear all;
clc;
format long;
printf('Trapezoidal rule for numerical integration\n');

#function to be integrated
function [result] = f(x)
	result = exp(x)*cos(x);
endfunction

#limits of integration
a = 0; #lower limit
b = pi; #upper limit
n = input('Enter the number of sub intervals for composite integration:');
sum = 0;
x = a;
h = (b - a) / n;
for i =0:n
	%x
	sum = sum + h*f(x);
	x = x + h;
endfor
sum = sum -1/2*h*( f(a) + f(b));
printf('I(f) = ');
disp(sum);
