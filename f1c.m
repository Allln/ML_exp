function [means, classcounter] = f1c(D_min, r)
VSTUP = load('dataz.txt');

x = VSTUP(:, 1);
y = VSTUP(:, 2);

delka1 = length(x);
dist_c = zeros(delka1,delka1);
i = 0;

while(i < delka1)
    i = i + 1;
    for j = 1:delka1
        vzd = sqrt((x(i) - x(j))^2 + (y(i) - y(j))^2);
        
        if vzd == 0
            dist_c(i, j) = NaN;
        else
            dist_c(i, j) = vzd;
            
        end
    end
end

x3 = VSTUP(:, 1);
y3 = VSTUP(:, 2);

B_M = [x3(1), y3(1)];
distMatrx = zeros(1);

% parametr pro vytvareni dalsich stredu
param = 0.7;

vS = zeros(0);
dist_f = 0;
beh = 1;

for i = 2:delka1;
   distMatrx(i - 1) = sqrt((x3(i) - B_M(1, 1))^2 + (y3(i) - B_M(1, 2))^2);
end

y3(1) = NaN;
x3(1) = NaN;
[velMax, index] = max(distMatrx(:));

B_M = [B_M;
        x3(index + 1) y3(index+1)];
    
classcounter = length(B_M(:, 1));
y3(index + 1) = NaN;
x3(index + 1) = NaN;

while beh == 1
    
    matSM = zeros(delka1, length(B_M(:, 1)));
    
    for i = 1:length(B_M(:, 1))
        for j = 1:delka1
            
            vzd = sqrt((x3(j) - B_M(i, 1))^2 + (y3(j) - B_M(i, 2))^2);
            matSM(j, i) = vzd;
            
            if(vzd == 0)
                matSM(j, i) = NaN;
                
            end
        end
    end

    minVZD = matSM;

    for i = 1:delka1;
        
        minP = min(minVZD(i, :));
        
            for j = 1:length(minVZD(1, :))
                
                if minVZD(i, j) ~= minP
                    minVZD(i, j) = NaN;
                    
                end
            end
    end

    [vel, index2] = max(minVZD(:));
    [q,w] = ind2sub(size(minVZD), index2);
    
    tempmbl = 0;
    
    for i = 1:length(B_M(:, 1)) - 1;
        tempmbl =  tempmbl + i;
    end
    
    vS = zeros(tempmbl, 1);

    for i = 1:length(B_M(:, 1));
        for j = i + 1:length(B_M(:, 1));
            vS(i) = sqrt((B_M(i, 1) - B_M(j, 1))^2 + (B_M(i,2)-B_M(j,2))^2);
        end
    end

    for i = 1:length(vS(:, 1));
        dist_f = dist_f + vS(i, 1);
    end

    if(param * (dist_f / length(vS(:, 1))) < vel)
        B_M = [B_M;
               x3(q) y3(q)]; 
        classcounter = classcounter + 1;
        y3(q) = NaN;
        x3(q) = NaN;
    
    else
        beh = 0;
    end

end

finalclassN = size(B_M);
finalNumr = finalclassN(1);
finalNumc = finalclassN(2);
points = zeros(finalNumr, 2);

for i=1:finalNumr
    points(i, 1) = B_M(i, 1);
end

for i = 1:finalNumr
    points(i, 2) = B_M(i, 2);
end

matbsz = size(B_M);
means = zeros(matbsz(1), 1)

for i = 1:matbsz(1)
    
    temp = B_M(i, 1);
    
    for j = 1:4444
        if(x(j) == temp)
            means(i, 1) = j;
            
        end
    end
end
means