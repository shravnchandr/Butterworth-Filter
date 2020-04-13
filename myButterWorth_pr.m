Ap= 3;  As= 30;
ompl= 1400;   omph= 1800;
omsl= 1000;   omsh= 2200;
omp = [ompl omph];  oms = [omsl omsh];
Bw = omph - ompl;   omo = sqrt(ompl * omph);
filter = 'bpf';

N= getOrder(omp, oms, Ap, As, filter);
disp(['Order of System= ', num2str(N)]);
disp(['Cut0ff Freq= ', num2str(omo)]);
[w,x,y,z] = getCoeff(N/2);
num_coeff = [0,0,0,1];
deno_coeff = [w,x,y,z];
printsys(num_coeff, deno_coeff, 's');
[new_num, new_deno] = getNewCoeff_pr(omo, N/2, Bw, filter);
printsys(new_num, new_deno, 's');

figure(1);
w= 0:1:3000; freqs(new_num, new_deno, w);
figure(2);
[H, wl]= freqs(new_num, new_deno, w);
H= 20*log10(H);
plot(wl, H, 'k'); axis([1000 2000 -120 0]);
