clc
close all
clear all

tData = tData();
data = 'datazerr.txt';

[tempclss, pdtcls, mns, ~, ~] = f_4t(data);

s = f4b(data, tData);

figure
hold on;

for i = 1:3
    scatter(s(i).Ts(:, 1), s(i).Ts(:, 2), '.');
end

for i = 1:3
    scatter(pdtcls(i).Ts(:, 1), pdtcls(i).Ts(:, 2), '.');
end

for i = 1:3
    scatter(mns(i, 1), mns(i, 2), "+");
end

mnt1 = mns(:, 1);
mnt2 = mns(:, 2);

plot(mnt1, mnt2, "+");

title('Vektorova kvantizace');
xlabel('priznak1'); 
ylabel('priznak2'); 
legend('trida1', 'trida2', 'trida3');
xlim([-15, 15]);
ylim([0, 22]);