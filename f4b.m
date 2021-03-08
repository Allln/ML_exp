function [ret1] = f4b(d, tData)

    [rf2, mns, ret1, ret2f] = f2_2(d);
    [mns, ~, ~] = f3(ret1, mns, ret2f, d);
    
    ret1 = struct();
    
    for i = 1:rf2 
        ret1(i).Ts = [];
    end

    lTD = size(tData,1);
    i = 1;
    
    while(i <= lTD)    
        dists = [];
        
        for j = 1:rf2
            dists(j) = NRM(mns(j,:), tData(i,:));
        end
        
        m = min(dists);
        index = find(dists == m);
        
        ret1(index).Ts = [ret1(index).Ts;
                          tData(i,:)];
        i = i + 1;
    end
end