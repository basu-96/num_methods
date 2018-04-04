clear all;
printf('interpolation by divided diff\n');
x = load('div_diff-data.dat');
n = length(x(:,1));
ddiff = [];
ddiff = [ddiff; x];
for j=1:n-1;
  for i=1:n-j;
    ddiff(i,j+2)=(ddiff(i+1,j+1)-ddiff(i,j+1))/(ddiff(i+j,1)-ddiff(i,1));
  endfor
endfor
