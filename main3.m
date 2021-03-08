clc
close all
clear all

data = 'datazerr.txt';

[xxx, mns, strd, retf2] = f2_2(data);

subplot(2,1,1)
hold on

for i = 1:3
    scatter(strd(i).Ts(:, 1), strd(i).Ts(:, 2), '*');
end

mns1 = mns(:, 1);
mns2 = mns(:, 2);

scatter(mns1, mns2, "+");

title('Kmeans');
xlabel('priznak1'); 
ylabel('priznak2'); 
legend('trida1', 'trida2', 'trida3');

[mns1, s1] = f3(strd, mns, retf2, data);

subplot(2, 1, 2)
hold on

for i = 1:3
    scatter(s1(i).Ts(:, 1), s1(i).Ts(:, 2), '*')
end

mns11 = mns1(:, 1);
mns12 = mns1(:, 2);

scatter(mns11, mns12, "+");

title('Iterativni optimalizace');
xlabel('priznak1'); 
ylabel('priznak2'); 
legend('trida1', 'trida2', 'trida3');
