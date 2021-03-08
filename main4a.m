clc
close all
clear all

datazz = "dataz.txt"

[retpts, ret1, clsn] = F4a(datazz);

figure
hold on;
for i = 1:clsn
    scatter(ret1(retpts{1, i}, 1), ret1(retpts{1, i}, 2));
end

title('Bayesuv klasifikator');
legend('trida1', 'trida2', 'trida3');