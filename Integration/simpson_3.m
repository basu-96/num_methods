clear all;
clc;
format long;

printf('Simpsons 1/3 rule for numerical integration\n');

#integrand function
function [result] = f(x)
	result = exp(x)*cos(x);
endfunction

#limits of integration
a = 0; # lower limit
b = pi; # upper limit
n = input('Enter the number of sub-intervals for the composite integration:');
n = n/2;
h = (b - a)/n;
x = a;
sum = 0;
for i = 0:n-1
	sum = sum + h/6 * (f(x) + 4*f(x + h/2) + f(x+h));
	x = x + h;
endfor
sum
