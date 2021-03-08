clc
close all
clear all

tData = tData();
data = 'dataz.txt'; 
[xxx, sstrf4, mns, ~, ~] = f_4t(data);

strcscls = f4c(data,tData);
figure

hold on;
for i = 1:3
    scatter(strcscls(i).Ts(:, 1), strcscls(i).Ts(:, 2), '*');
end

for i = 1:3
    scatter(sstrf4(i).Ts(:, 1), sstrf4(i).Ts(:, 2), '+');
end

for i=1:3
    scatter(mns(i, 1), mns(i, 2), "+");
end

mns1 = mns(:, 1);
mns2 = mns(:, 2);
plot(mns1, mns2, "+g");

title('Klasifikace podle nejblizsiho souseda');
xlabel('priznak1'); 
ylabel('priznak2'); 
xlim([-15, 15]);
ylim([0, 22]);
legend('trida1', 'trida2', 'trida3', 'Stredy');
