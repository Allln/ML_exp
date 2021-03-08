
function [re1, data, rt_, mns] = f_2t(d)

    [data, Dist_m, rt_] = load_d(d);
    [mns, re1] = f1c(Dist_m, rt_);
    
end