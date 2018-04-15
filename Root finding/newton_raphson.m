clc
clear all
printf("Root finding by Newton-Raphson method\n");
x = input('Enter initial guess x0: ');
tol = input('Enter tolerance value :');
itr = [];
loops = 0;
fileid = fopen('newton.txt', 'w');
fprintf(fileid, '%9s %10s %14s %15s\n', 'iteration', 'x_n', 'x_n+1', '|f(x_n+1)|');
while abs(func(x)) > tol
	loops = loops + 1;
	y = x - func(x)/derivative(x);
	fprintf(fileid, '%9d %6.8f %6.8f %6.8f \n', loops, x, y, abs(func(y)));
	x = y;
	itr = [itr;y];
end
fclose(fileid);
