function [xxx, mns, s] = f2(d)

    [data, Dist_m, r] = load_d(d);
    [m, xxx] = f1c(Dist_m, r);
    s = struct;
    i = 1;
    
    while(i <= xxx)
       mns(i, 1) = data(m(i), 1);
       mns(i, 2) = data(m(i), 2);
       s(i).Ts = [];
       i = i + 1;
    end
    
    mean_ = 0;
    k = 0;
    check = 0;
    
    while mns ~= mean_
        check = check + 1;
        k = k + 1;
        mean_ = mns;
        
        for i = 1:xxx
            s(i).Ts = [];
        end
        
        for a = 1:r
           for b = 1:xxx
               
               data1 = (data(a, 1) - mns(b, 1))^2;
               data2 = (data(a, 2) - mns(b, 2))^2;
               
               dist(b, 1) = data1 + data2;
           end
           
           if find(dist ~= 0)
               m = min(dist);
               index = find(dist == m);
               index = index(1, 1);
               s(index).Ts = [s(index).Ts; 
                              data(a,:)];
           else
               0;
           end
        end

        for a = 1:xxx
            szD = size(s(a).Ts);
            ltd = szD(1, 1);
            sum = [0, 0];
            
            for i = 1:ltd
                sum(1, :) = sum(1, :) + s(a).Ts(i, :);
            end
            
            mns(a, :) = sum(1, :) / ltd;
        end
    end
end
