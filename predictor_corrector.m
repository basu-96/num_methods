clear all;
clc;
printf('Predictor-corrector method to solve differential equations\n')

function [result] = f(x, y)
	result = 1/(1 + x^2) - 2*y^2;
endfunction
x = [];
x(1) = input('Enter initial value of x :');
y0 = input('Enter initial value of y: ');
b = input('Enter the value of x at which y(x) will be evaluated :');
count = 1;
h = input('Enter step-size :');
l = input('Input order of correction:');
m = l + 2;
n = (b - x(1))/h;
n = n+1;
for i = 1:n
	x = [x; x(1) + i*h];
endfor
dat = zeros(n,m);
for i = 1:n
	dat(i,1) = x(i);
end
dat(1,1) = x(1);
for i = 2:m
	dat(1,i) = y0; 
endfor

for i = 2:n;
	#predicted value
	dat(i,2) = dat(i-1, m) + h * f(x(i-1), dat(i-1, m));
	for j = 3:m
		#correction
		dat(i,j) = dat(i-1,m) + h/2*(f(x(i-1), dat(i-1, m)) + f(x(i) , dat(i, j-1)) );
	end
end
dat		
