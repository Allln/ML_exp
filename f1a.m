function [f1ret, counter] = f1a(Dist_m, r, t)
    counter = 1;
    ma = Dist_m;
    f1ret = zeros(r-1, 1);
    iter = 1;
    
    while(iter <= r-1)
        m = min(ma(:));
        f1ret(iter) = m;
        
        if(m > t)
            counter = counter +1;
        end
        
        [row, clmn] = find(ma == m);
        row = row(1, 1);
        clmn = clmn(1, 1);
        ma(row, clmn) = NaN;
        ma(clmn, row) = NaN;
    
        for j = 1:r
            if ma(j, clmn) > ma(j, row)
                ma(j, clmn) = ma(j, row);
                ma(clmn, j) = ma(row, j);
                ma(j, row) = NaN;
                ma(row, j) = NaN;
            else
                ma(j, row) = NaN;
                ma(row, j) = NaN;
            end
        end
        iter = iter + 1;
    end
end