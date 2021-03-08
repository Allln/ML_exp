clc
close all
clear all

%load
[data, Dist_m, xxx] = load_d('dataz.txt');

%experimentalne nalezena krit. hodnota
t = 33;
x0 = randi(4444);
[szn, counter, ind] = f1b(Dist_m, xxx, t, x0, data);

figure
hold on
plot(1:xxx - 1, szn);
p1 = plot([0, 4444], [t, t]);

title('Prubeh vzdalenosti sousedu kriticka hodnota = 33');
legend(p1,'Vzdalenost rozdeleni shluku');
xlabel('Index obrazu'); 
ylabel('KRIT! Vzdalenost k dalsimu obrazu'); 
bar(szn,"b")

data1 = data(:, 1);
data2 = data(:, 2);
ind1 = ind(:, 1);
ind2 = ind(:, 2);

figure
plot(data1, data2, "*");
hold on
p1 = plot(ind1, ind2);
title('Rezezova mapa');
xlabel('priznak1');
ylabel('priznak2');
legend(p1, 'Vzdalenost obrazu');