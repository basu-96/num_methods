a = 50.5;
b = 21.2;
x = (0:0.25*pi:pi);
y = sin(x);
tablexy = [x;y];
file1 = fopen('sample.txt' , 'w');
fprintf(file1 , '%6s %6s %6s\n' , 'a' , 'b', 'c');
fprintf(file1 , '%6.2f %6.2f \n', tablexy);
fclose(file1);
