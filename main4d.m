clc 
close all
clear all

%% sim
tDtata = tData();%rastr
data = 'dataz.txt';

[xxx, strcs, means, ~, ~] = f_4t(data);
%params
q1 = [1, 1, 1];
delta = 5;
beta = 25;

[a1, b1, c1] = f4dd(data, tDtata, q1);
[a2, b2, c2] = f4ddd(data, tDtata, delta, beta, q1); 
[a3, b3, c3] = f4dddd(data, tDtata, delta, beta, q1);
%% plots
figure
hold on
x = linspace(-15, 15);

for i = 1:3
    y1(i, :) = (-b1(i).qk(1, 1) - b1(i).qk(1, 2) * x) / b1(i).qk(1, 3);
end

for i = 1:3
    p(i) = scatter(a1(i).Ts(:, 1), a1(i).Ts(:, 2), '.');
end

for i = 1:3
    scatter(strcs(i).Ts(:, 1), strcs(i).Ts(:, 2),'.');
end

for i = 1:3
    ldf = plot(x(1, :), y1(i, :), "g");
end

for i=1:3
    scatter(means(i, 1), means(i, 2), ".");
end

title('Rosenblattuv algoritmus delta = 0, ck = 2');
legend([p(1) p(2) p(3) ldf], 'trida1', 'trida2', 'trida3', 'LD funkce');
xlabel('priznka1'); 
ylabel('priznka2'); 
xlim([-15, 15]);
ylim([0, 22]);

figure
subplot(1,2,1);
hold on

for i = 1:3
    y2(i, :) = (-b2(i).qk(1, 1) - b2(i).qk(1, 2) * x) / b2(i).qk(1, 3);
end

for i = 1:3
    y3(i, :) = (-b3(i).qk(1, 1) - b3(i).qk(1, 2) * x) / b3(i).qk(1, 3);
end

for i = 1:3
    p(i) = scatter(a2(i).Ts(:, 1), a2(i).Ts(:, 2), '.');
end

for i = 1:3
    scatter(strcs(i).Ts(:, 1), strcs(i).Ts(:, 2), '.');
   
end

for i = 1:3
    ldf = plot(x(1, :), y2(i, :), "g");
end

for i=1:3
    scatter(means(i, 1), means(i, 2), ".");
end

title('Metoda konstantnich prirustku beta = 25 delta = 5 ');
legend([p(1) p(2) p(3) ldf], 'trida1', 'trida2', 'trida3', 'LD funkce');
xlabel('priznak1'); 
ylabel('priznak2'); 
xlim([-15, 15]);
ylim([0, 22]);

subplot(1,2,2);
hold on
for i = 1:3
    p(i) = scatter(a3(i).Ts(:, 1), a3(i).Ts(:, 2), '.');
end

for i = 1:3
    scatter(strcs(i).Ts(:, 1), strcs(i).Ts(:, 2), '.');
end

for i = 1:3
    ldf = plot(x(1, :), y3(i, :), "g");
end

for i=1:3
    scatter(means(i, 1), means(i, 2), ".");
end

title('Upravena Metoda konstantnich prirustku beta = 25 delta = 5 ');
legend([p(1) p(2) p(3) ldf], 'trida1', 'trida2', 'trida3');
xlabel('priznak1'); 
ylabel('priznka2'); 
xlim([-15, 15]);
ylim([0, 22]);