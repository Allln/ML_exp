function [ret1, ret2, ret3] = f4dddd(d, tData, dlt, beta, qqq)
    [fori, means, s, rf2] = f2_2(d);
    [~, ~, rf2] = f3(s, means, rf2, d);
    
    r = length(rf2);
    Mr_ = zeros(r, size(rf2, 2) + 1);
    
    for i = 1:size(rf2, 1)
        Mr_(i,:) = [1,rf2(i,:)];
    end
    
    tData1 = zeros(size(tData, 1), size(tData, 2)+1);
    
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
        while f > 0
            k = k + 1;
            f = 0;
            for j = 1:r
                if Mr_(j, 4) ~= i
                    UU = -1;
                else
                    UU = 1;
                end
                
                qh = qk * Mr_(j, 1:3)'*UU;
                ck = beta / (Mr_(j, 2)^2 + Mr_(j, 3)^2);
                
                if qh < dlt
                    f = 1;
                    while qh < dlt
                        qk = qk + ck * Mr_(j, 1:3)*UU;
                        qh = qk * Mr_(j, 1:3)'*UU;
                    end
                end
            end
        end
        
        ret2(i).qk = qk;
        ret3(i) = k;
        
    end

    ret1 = struct();
    
    for i = 1:4
       ret1(i).Ts = [];
    end
    
    lTD = size(tData1, 1);
    
    for i = 1:lTD
        sum = 0;
        
        for j = 1:3
            sgm = 0;
            for a = 1:3
                sgm = sgm + ret2(j).qk(1, a)*tData1(i, a);
            end
            
            if qqq + sgm >= dlt
                
                sum = sum + 1;
                tempw = j;
            else
                sum = sum + 0;
            end
        end

        if sum ~= 1
            ret1(3 + 1).Ts = [ret1(4).Ts;
                              tData1(i, 2:3)];
        else
            ret1(tempw).Ts = [ret1(tempw).Ts;
                              tData1(i, 2:3)];
        end
    end
end