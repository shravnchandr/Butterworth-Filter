function [new_num, new_deno] = getNewCoeff_pr(omo, N, Bw, filter)
    len = N*2 +1;    q = len-N;
    new_num = zeros(1,len);
    new_deno = ones(1, len);

    if filter == 'bpf'
        new_num(q) = power(Bw,2);
    elseif filter == 'brf'
        new_num(1) = 1;     new_num(3) = 2*power(omo,2);    new_num(5)=power(omo,4);
    end
        
    new_deno(2) = Bw*sqrt(2);   new_deno(3) = power(Bw,2) + 2*power(omo,2);
    new_deno(4) = sqrt(2)*Bw*power(omo,2);  new_deno(5) = power(omo,4);
end
