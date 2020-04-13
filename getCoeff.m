function [w,x,y,z] = getCoeff(N)
    if N == 1
        temp = [0,0,1,1];
    elseif N == 2
        temp = [0,1,sqrt(2),1];
    elseif N == 3
        temp = [1,2,2,1];
    end
    w = temp(1);    x = temp(2);    
    y = temp(3);    z = temp(4);
end
