function [retpts, RRR, clsn] = F4a(d)
    [classN_, means, s] = f2(d);
    
    VSTUP = load(d);
    
    x = VSTUP(:, 1);
    y = VSTUP(:, 2);
    R = zeros(0,3);

    for j = -15:0.25:15
        for i = 2:0.25:22
            R = [R;
                 j, i];
        end
    end

    cB1 = cell(1, classN_);
    matSB1 = means;

    Pw = zeros(1, classN_);

    szc1 = size(s(1).Ts);
    szc1_ = szc1(1);
    tempV1 = zeros(szc1_,1);
    
    szc2 = size(s(2).Ts);
    szc2_ = szc2(1);
    tempV2 = zeros(szc2_,1);
    
    szc3 = size(s(3).Ts);
    szc3_ = szc3(1);
    tempV3 = zeros(szc3_,1);

    szx = size(x);
    xxx = szx(1);

    for j = 1:xxx
    temp = x(j, 1);
    
        for i = 1:szc1_
            if(temp == (s(1).Ts(i,1)))
                tempV1(i, 1) = j;
            end
        end
    end

    for j = 1:xxx
    temp = x(j, 1);
    
        for i = 1:szc2_
            if(temp == (s(2).Ts(i, 1)))
                tempV2(i, 1) = j;
            end
        end
    end

    for j = 1:xxx
    temp = x(j, 1);
    
        for i = 1:szc3_
            if(temp == (s(3).Ts(i,1)))
                tempV3(i, 1) = j;
            end
        end
    end
    
    finalcell = cell(1, 3);
    finalcell{1,1} = tempV1;
    finalcell{1,2} = tempV2;
    finalcell{1,3} = tempV3;

    for i = 1:classN_
    Pw(i) = length(finalcell{1, i}) / xxx;
    end

    M_ko = zeros(2, 2, classN_);

    for i = 1 : classN_
        for j = 1 : length(finalcell{1, i})
            pom = [matSB1(i, 1);
                   matSB1(i, 2)] - [x(finalcell{1, i}(j, 1));
                   y(finalcell{1, i}(j, 1))];

            pom = pom * pom.';
            M_ko(:, :, i) = M_ko(:, :, i) + pom;
        end
    
    M_ko(:, :, i) = M_ko(:, :, i)  /j;
    
    end

    for i = 1 : length(R(:, 1));
    pravd = zeros(1, classN_);

        for j = 1 : classN_

            pom = (1 / sqrt((2 * pi)*det(M_ko(:, :, j)))) * exp((-1/2)*(R(i, :) - matSB1(j, :))*inv((M_ko(:, :, j)))*(R(i, :)-matSB1(j, :)).');
            pravd(j) = pom * Pw(j);

        end
    
    [~, index] = max(pravd);
    cB1{1, index} = [cB1{1, index}, i];

    end

retpts = cB1;
RRR = R;
clsn = classN_;

end