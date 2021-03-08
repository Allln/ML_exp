function [mns, s, retf3] = f3(s, mns, retf3, d) 

    [~, Dist_m, r] = load_d(d);
    [~, id] = f1c(Dist_m, r);
    
    ch_ = 0;
    
    temst = 1;
    while(temst < id)
        l = length(s(temst).Ts);
        for j = 1:l
            ch_ = ch_ + NRM(s(temst).Ts(j, :), mns(temst, :));
        end
        temst = temst + 1;
    end
    i = temst;

    crit = 0;
    k = 0;
    
    while crit == 0
        
        k = k + 1;
        stt = ch_;
        opn = s;
        stt_T = retf3;
        
        for a = 1:r
            i = retf3(a, 3); 
            
            if length(s(i).Ts) == 1
                break;
            end
            
            for b = 1:id
                Aj(b, 1) = 0;
            end
            
            Ai = length(s(i).Ts) / (length(s(i).Ts) - 1) * NRM(retf3(a, 1:2), mns(i, :));
            
            for j = 1:id
                
                if j ~= i
                    Aj(j, 1) = length(s(j).Ts) / (length(s(j).Ts) + 1) * NRM(retf3(a, 1:2), mns(j, :));
                else
                    Aj(j, 1) = NaN;
                end
            end
            
            AAsr = min(Aj);
            Asr = find(Aj == AAsr);
            
            if Ai > AAsr
                s(Asr).Ts = [s(Asr).Ts;
                               retf3(a, 1:2)];
                           
                temp = find(s(i).Ts == retf3(a, 1:2));
                temp = temp(1, 1);
                
                s(i).Ts = [s(i).Ts(1:temp - 1, 1:2);
                           s(i).Ts(temp + 1:length(s(i).Ts), 1:2)];
                       
                retf3(a,3) = Asr;
            else
                0;
                
            end
        end

        ch_=0;
        
        for i = 1:id
            len = length(s(i).Ts);
            sum = [0, 0];
            
            for a = 1:len
                sum(1, :) = sum(1, :) + s(i).Ts(a, :);
            end
            
            mns(i, :) = sum(1, :) / len;
        end
        
        for i = 1:id
            len = length(s(i).Ts);
            
            for a = 1:len
                ch_ = ch_ + NRM(s(i).Ts(a, :), mns(i, :));
            end
        end

        if stt > ch_
            0;
        else
            s = opn;
            retf3 = stt_T;
            crit = 1;
        end
end