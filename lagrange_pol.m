#program to find the interpolating polynomial using Lagrange's method
clear all;
printf("Lagrange interpolation polynomial\n");
dat = load('lagrange_data.dat');
%number of data points given
n = rows(dat);
L = [];# l_i(x), i =0,1...,n
F = 0;# final polynomial
for i = 1:n
	a = [1];
	D = 1;
	for j = 1:n
		if j ~= i			
			a = conv(a,[1, -dat(j,1)]);
			D = D * (dat(i,1) - dat(j,1));
		endif
	end
	L = [L;a/D];
	F = F + dat(i,2) * L(i,:);
end
x = input('Enter x:');
polyval(F,x)

