clc
clear all
printf('Root finding by secant method\n');
printf('Input initial guesses:\n');
x0 = input('enter x0 : ');
x1 = input('enter x1 : ');
loops = 0;
fileid = fopen('secant_dat.txt', 'w');
fprintf(fileid, '%14s %14s %14s %14s %14s %14s\n', 'loops', 'x_n-1', 'x_n', 'x_n+1', '|f(x_n+1)|', '|x_n+1 - x_n|');
while abs(func(x1) - func(x0)) > 0.001
  x = x1  - func(x1)*(x1 - x0)/(func(x1) - func(x0));
  fprintf(fileid, '%10d %16.4f %16.4f %16.4f %16.4f %16.4f\n', loops, x0, x1, x, abs(func(x)), abs(x-x1));
  x0 = x1;
  x1 = x;
  loops = loops + 1;
end
fclose(fileid);
  
