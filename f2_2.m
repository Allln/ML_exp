function [xxx, mns, s, data_] = f2_2(d)

    [data, Dist_m, r] = load_d(d);
    [m, xxx] = f1c(Dist_m, r);
    
    data_ = data;
    s = struct;
    
    i = 1;
    while(i <= xxx)
       mns(i, 1) = data_(m(i), 1);
       mns(i, 2) = data_(m(i), 2);
       i = i + 1;
    end

    mnsS = 0;
    k = 0;
    
    while mns ~= mnsS
        k = k + 1;
        mnsS = mns;
        
        for i = 1:xxx
            s(i).Ts = [];
        end
        
        for a = 1:r
            
           for b = 1:xxx
               dist(b, 1) = NRM(data_(a, 1:2), mns(b, :));
           end
           
           m = min(dist);
           locp = find(dist == m);
           locp = locp(1, 1);
           s(locp).Ts = [s(locp).Ts;
                         data_(a, 1:2)];
           data_(a, 3) = locp;  
        end

        while(a <= xxx)
            sizeTs = size(s(a).Ts);
            l = sizeTs(1, 1);
            sum = [0, 0];
            
            for i = 1:l
                sum(1, :) = sum(1, :) + s(a).Ts(i, :);
            end
            
            mns(a, :) = sum(1, :) / l;
            a = a + 1;
        end
    end
end