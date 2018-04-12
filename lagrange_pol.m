#program to find the interpolating polynomial using Lagrange's method
clear all;
printf("Lagrange interpolation polynomial\n");
dat = load('lagrange_data.dat');
%number of data points given
n = rows(dat);
P = [];
F = 0;
for i = 1:n
	a = [1];
	D = 1;
	for j = 1:n
		if j ~= i			
			a = conv(a,[-dat(j,1), 1]);
			D = D * (dat(i,1) - dat(j,1));
		endif
	end
	P = [P;a/D];
	F = F + dat(i,2) * P(i,:);
end
x = input('Enter x:');
sum = 0;
for i = 1:n
	sum = sum + F(i)*realpow(x, i-1);
end
sum
