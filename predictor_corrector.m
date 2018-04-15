clear all;
clc;
printf('Predictor-corrector method to solve differential equations\n')

function [result] = f(x, y)
	result = 1/(1 + x^2) - 2*y^2;
endfunction
x = [];
x(1) = input('Enter initial value of x :');
y0 = input('Enter initial value of y: ')
b = input('Enter the value of x at which y(x) will be evaluated :');
count = 1;
h = input('Enter step-size :');
l = input('Input order of correction:');
n = (b - x(1))/h;
for i = 1:n
	x = [x; x(1) + i*h];
endfor
dat = zeros(n,l+2);
dat(1,1) = x(1);
for i = 2:l+1
	dat(1,i) = y0; 
endfor

