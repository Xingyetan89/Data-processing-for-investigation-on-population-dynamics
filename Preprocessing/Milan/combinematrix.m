ITS = I(:,1);
for i = 1 : 720
    T = I(:,i*2) + I(:,i*2+1);
    ITS = [ITS,T];
end