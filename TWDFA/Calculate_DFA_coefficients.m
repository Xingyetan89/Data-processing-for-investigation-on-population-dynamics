m = length(x);
n = length(y(:,1));
x1 = [ones(m,1),x'];
Result = [];
for i = 1 : n
    y1 = y(i,:)';
    b1 = (x1' * x1) \ (x1' * y1);
    R2 = (abs(b1' * x1' * y1) - m * mean(y1) ^ 2) / (abs(y1' * y1) - m * mean(y1) ^ 2);
    Result = [Result; b1(2) R2];
end
