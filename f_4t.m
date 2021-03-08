
function [re1, strc, mns, rt_, r] = f_4t(d)

    [re1, strc, mns, rt_, r] = f_3t(d);
    [mns, strc, rt_] = f3(strc, mns, rt_, d);
    
end