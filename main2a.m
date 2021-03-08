clc
close all
clear all

%load
[data, Dist_m, r] = load_d('datazerr.txt');

[counter_M, mns, strd] = f2('datazerr.txt');

figure
hold on

for i = 1:counter_M
    scatter(strd(i).Ts(:, 1), strd(i).Ts(:, 2), "+");
end

mns1 = mns(:, 1);
mns2 = mns(:, 2);
scatter(mns1, mns2, ".");

title('Kmeans'); 
xlabel('priznak1'); 
ylabel('priznak2');
legend('trida1', 'trida2', 'trida3');

sz_1 = size(strd(1).Ts);
sz_2 = size(strd(2).Ts);
sz_3 = size(strd(3).Ts);

temparsz = [sz_1, sz_2, sz_3];
check = 0;

for i = 1:2:6
    check = check + temparsz(i);
end

if(check == 4444)
    disp("all data were classified")
else
    disp("some data were not classified")
end