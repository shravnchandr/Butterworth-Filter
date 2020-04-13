function N = getOrder(omp, oms, Ap, As, filter)
    num1 = power(10, 0.1*As) -1;
    num2 = power(10, 0.1*Ap) -1;
    num = log(num1/num2);
    if filter == 'lpf' | filter == 'hpf'
        temp = [omp,oms];  Vs = max(temp)/min(temp);
    elseif filter == 'bpf' | filter == 'brf'
        Vs = (oms(2)-oms(1))/(omp(2)-omp(1));
    end
    deno = 2* log(Vs);
    N = ceil(num/deno);
end