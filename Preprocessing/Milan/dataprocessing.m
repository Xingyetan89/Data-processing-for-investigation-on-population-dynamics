A = unique(da4(:,1));
T = unique(da4(:,2));
m = length(A);
n = length(T);
ZO = zeros(m,n);
TS = [T';ZO];
B = [0;A];
TS = [B,TS];
[x,y] = size(da4);

for i = 1 : x
    id = da4(i,1);
    time = da4(i,2);
    value = da4(i,8);
    row = find(TS(:,1)==id);
    col = find(TS(1,:)==time);
    TS(row,col) = value;
end



