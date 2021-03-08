clc
close all
clear all
%load
[data, Dist_m, r] = load_d('datazerr.txt');

data1 = data(:, 1);
data2 = data(:, 2);

[means, id] = f1c(Dist_m, r);

s = size(means);
spl = s(1, 1);
pts = zeros(spl, 2);

for i = 1:s(1, 1)
    pts(i, :) = data(means(i, 1), :);
end

data1 = data(:, 1);
data2 = data(:, 2);

figure
hold on
plot(data1, data2, "+");
plt1 = plot(pts(:, 1), pts(:, 2), "*");
title('MAXIMIN'); 
xlabel('priznak1'); 
ylabel('priznak2');
legend(plt1, 'Stred');