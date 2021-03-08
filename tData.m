%% testovací data

function [tData] = tData()
    tData = zeros(0, 2);
    
    for j = -15:0.2:15 
        for i = 0:0.2:22
            tData = [tData;
                        j, i];
        end
    end
end