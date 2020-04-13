function [new_num, new_deno] = getNewCoeff_lh(omc, N, filter)
    if N == 2
        new_deno = [0, 1, sqrt(2), 1];
    elseif N == 3
        new_deno = [1, 2, 2, 1];
    end
    len = length(new_deno);    q = len-N;
    new_num = zeros(1,len);

    if filter == 'lpf'
        new_num(len) = power(omc,N);
    elseif filter == 'hpf'
        new_num(q) = 1;
    end
    
    j = 0;
    for i=q:len
        new_deno(i) = new_deno(i) * power(omc, j);  j = j +1;
    end
end

