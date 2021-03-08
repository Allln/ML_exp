function [ret1, ret2, ret3] = f4ddd(d, tData, delta, beta, qqq)
    [fori, means, s, rf2] = f2_2(d);
    [~, ~, rf2] = f3(s, means, rf2, d);
    
    r = length(rf2);
    Mf_ = zeros(r, size(rf2, 2) + 1);
    
    for i = 1:size(rf2, 1)
        Mf_(i, :) = [1, rf2(i, :)];
    end
    
    tData1 = zeros(size(tData, 1), size(tData, 2) + 1);
    
    for i = 1:size(tData, 1)
        tData1(i, :) = [1, tData(i, :)];
    end
    
    ret2 = struct();
    
    for i = 1:3
       ret2(i).qk = [];
    end
    

    for i = 1:3
        qk = qqq;
        f = 1;
        k = 0;
        
        while f > 0 & k <1e5
            k = k + 1;
            f = 0;
            for j = 1:r
                if Mf_(j, 4) == i
                    UU = 1;
                else
                    UU = -1;
                end
                
                qh = qk * Mf_(j, 1:3)'*UU;
                ck = beta / (Mf_(j, 2)^2 + Mf_(j, 3)^2);
                
                if qh <delta
                    f = 1;
                    qk = qk + ck * Mf_(j, 1:3)*UU;
                end
            end
        end
        
        ret2(i).qk = qk;
        ret3(i) = k;
        
    end

    ret1 = struct();
    
    for i=1:3 + 1
       ret1(i).Ts = [];
    end
    
    lTD = size(tData1, 1);
    i = 1;
    
    while(i <= lTD)
        sum = 0;
        for j = 1:3
            sgm = 0;
            for a = 1:3
                sgm = sgm + ret2(j).qk(1, a) * tData1(i, a);
            end   
            
            if qqq + sgm < delta
                sum = sum + 0;
            else
                sum = sum + 1;
                temp_c = j;
            end
        end

        if sum ~= 1
            ret1(3 + 1).Ts = [ret1(3 + 1).Ts;
                              tData1(i, 2:3)];
        else
            ret1(temp_c).Ts = [ret1(temp_c).Ts;
                               tData1(i, 2:3)];
        end
        i = i + 1;
    end
end