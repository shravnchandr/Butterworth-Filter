Ap= 3;  As= 15;
oms= 400;   omp= 100;
filter = 'lpf';

N= getOrder(omp, oms, Ap, As, filter);
disp(['Order of System= ', num2str(N)]);
temp = power(10, 0.1*Ap) - 1;
deno = power(temp, (1/(2*N)));
omc = omp/deno;
disp(['Cut0ff Freq= ', num2str(omc)]);
[w,x,y,z] = getCoeff(N);
num_coeff = [0,0,0,1];
deno_coeff = [w,x,y,z];
printsys(num_coeff, deno_coeff, 's');
[new_num, new_deno] = getNewCoeff_lh(omc, N, filter);
printsys(new_num, new_deno, 's');

figure(1);
w= 0:1:500; freqs(new_num, new_deno, w);
figure(2);
[H, wl]= freqs(new_num, new_deno, w);
H= 20*log10(H);
plot(wl, H, 'k');
