function [ret1] = f4c(d, tData)

    [rf2, mns, rf2st, M_] = f2_2(d);
    [~, ~, M_] = f3(rf2st, mns, M_, d);
    
    ret1 = struct();
    
    for i = 1:rf2
       ret1(i).Ts = [];
    end
    
    SZD_ = size(tData, 1);
    SZD_u = SZD_(1);
    i = 1; 
    
    while(i <= SZD_u)
        
        for j = 1:size(M_, 1)
            nrm1 = M_(j, 1:2);
            nrm2 = tData(i, :);
            dsts_res(j) = NRM(nrm1, nrm2);
        end
        
        mini_ = min(dsts_res);
        ind = find(dsts_res == mini_);
        ind = ind(1, 1);
        tempc = M_(ind, 3);
        ret1(tempc).Ts = [ret1(tempc).Ts;
                          tData(i, :)];
        i = i + 1;
    end
end