
function [n] = NRM(a, b)
    n1 = (a(1, 1) - b(1, 1))^2;
    n2 = (a(1, 2) - b(1, 2))^2;
    n = n1 + n2;
end