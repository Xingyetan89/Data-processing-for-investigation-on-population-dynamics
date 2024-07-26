C = readmatrix('sample time series.csv');
h = 0;
m = length(C(:,2));
n = length(C(1,:)) - 1;
C2 = [];
for p = 1 : m
    Cp = C(p,2:n+1);
    Mp = mean(Cp);
    C1 = [];
    for k = 1 : n
        c = sum(Cp(1:k)-Mp);
        C1 = [C1,c];
    end
    C2 = [C2;C1];
end
k1 = h + 3;
k2 = floor(n/4);
C3 = k1 : k2;
Result = [];
Result = [Result;C3];
for p = 1 : m
    Cp = C2(p,:);
    temp = [];
    for s = k1 : k2
        count = floor(n/s);
        tot = count * s;
        sta = n - count * s + 1;
        s1 = 0;
        s2 = 0;
        x = 1 : s; 
        w = zeros(s,s);
        for i = 1 : s : tot
            a = i + s - 1;
            y = Cp(i:a);
            yp1 = [];
            for r1 = 1 : s
                for r2 = 1 : s
                    w(r2,r2) = (1 - ((r1 - r2) / s) ^2) ^ 2;
                end
                x1 = [ones(s,1),x'];
                y1 = y';
                b1 = (x1'* w * x1) \ (x1' * w * y1);
                f1 = b1(1) + b1(2) * x(r1);
                yp1 = [yp1;f1];
            end
            e1 = y1 - yp1;
            re1 = sumsqr(e1) / s;
            s1 = s1 + re1;
        end
        for j = n : -s : sta
            b = j - s + 1;
            y = Cp(b:j);
            yp1 = [];
            for r1 = 1 : s
                for r2 = 1 : s
                    w(r2,r2) = (1 - ((r1 - r2) / s) ^2) ^ 2;
                end
                x1 = [ones(s,1),x'];
                y1 = y';
                b1 = (x1'* w * x1) \ (x1' * w * y1);
                f1 = b1(1) + b1(2) * x(r1);
                yp1 = [yp1;f1];
            end            
            e1 = y1 - yp1;
            re1 = sumsqr(e1) / s;
            s2 = s2 + re1;
        end
        fs = sqrt((s1 + s2) / (2 * count));
        temp = [temp, fs];
    end
    Result = [Result;temp];
    disp(Result);
end