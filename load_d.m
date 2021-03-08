function [data, Dist_m, r] = load_d(d)
    data = importdata(d);
    sz = size(data);
    r = sz(1);
    c = sz(2);
    Dist_m = zeros(r);
    
    for i = 1:r
        for j = 1:r
            dist = NRM(data(i, :),data(j, :));
            if dist == 0
                Dist_m(i,j) = NaN;
            else
                Dist_m(i,j) = dist;
            end
        end
    end  
end