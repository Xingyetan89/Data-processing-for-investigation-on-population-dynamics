m = size(AFS);
n = length(r);
p = length(ts);
R1 = [];
R2 = [];
for i = 1 : m(1)
    x1 = AFS(i,:);
    x2 = x1';
    R1 = [R1; x2];
end
for i = 1 : n
    for j = 1 : p
        fs = -0.508 * log(r(i)) + 1.605 * log(ts(j)) - 0.0845 *  log(r(i)) * log(ts(j)) + 0.342;
        R3 = [fs, r(i), ts(j)];
        R2 = [R2; R3];
    end
end
Results = [R1, R2];

