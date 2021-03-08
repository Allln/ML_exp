clc
close all
clear all
%load
[data, Dist_m, xxx] = load_d('dataz.txt');

figure

data1 = data(:, 1);
data2 = data(:, 2);

plot(data1, data2, "+")
title('Data') 
xlabel('priznak1') 
ylabel('priznak2') 

t = 7;
[f1ret, counter1] = f1a(Dist_m, xxx, t);
x = 1:length(f1ret);

figure
hold on
plot(x, f1ret, '+');
title('Prubeh shluk. hl.'); 
xlabel('Spojeni shluku x'); 
ylabel('h'); 

for i = 1:counter1
    plt_1 = plot([0,4444],[f1ret(end - i + 1), f1ret(end - i + 1)]);
end

legend(plt_1, 'Hladiny vzniku tridy');
hold off;

%dendrogram
Z = linkage(data,'single');
figure
d = dendrogram(Z, 4444);
title('Dendrogram');