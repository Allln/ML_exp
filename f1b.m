function [szn, counter, id] = f1b(Dist_m, r, t, x0, data)
    Dist_m_f = Dist_m;
    counter = 0;
    
    szn = zeros(r-1, 1);
    id = zeros(r, 1);
    id(1, 1:2) = data(x0, :);
    
    stp = 1;
    while(stp < r - 1)
        d = min(Dist_m_f(:, x0));
        szn(stp) = d;
        
        if(d > t)
            counter = counter + 1;
        end
        
        row = find(Dist_m_f(:, x0) == d);
        row = row(1, 1);
        
        Dist_m_f(:, x0) = NaN;
        Dist_m_f(x0, :) = NaN;
        
        x0 = row;
        id(stp + 1, :) = data(x0, :);
        stp = stp + 1;
    end
end