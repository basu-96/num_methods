clear all;
#clf;
printf("bisection method of root finding\n");
a = input('input a :');
b = input('input b :');
tol = input('input tolerance :');
loops = 0;
itr = [];%stores the iterates
fileid = fopen('b_itr.txt' , 'w');
fprintf(fileid,'%8s %13s %14s %14s\n','Iteration','a', 'b', 'r');
fprintf(fileid, '%7d %16.8f %16.8f %16.8f\n', loops, a, b, (a+b)/2);
##this 'if' is to check whether the inputs are already the solutions
if func((a+b)/2) ~= 0
    #while the width of the iterates is more than tolerance
    while abs(a - b) > tol
        if func(a) * func((a+b)/2) < 0
            b = (a+b)/2;
        elseif func(b) * func((a+b)/2) < 0
            a = (a+b)/2;
        end   
        r = (a + b) / 2;
        itr = [itr;r];
        loops = loops + 1;
	fprintf(fileid, '%7d %16.8f %16.8f %16.8f\n', loops, a, b, r);
    end
end
fclose(fileid);
j = [1:1:loops];
plot(j,itr, "b-");
title("Bisection method");
xlabel('Iteration no.');
ylabel('iterate value');
xlim([1,loops]);
ylim([min(itr), max(itr)]);
print -dpdf Iteration-no-vs-points_fix_b.pdf
