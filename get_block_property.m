%input matrix and 4 index diagonal of matrix (starti,endi,startj,endj)
%returns 8 dimessional vector which represents property of this particular 
%block of the frame 

%please note how indices of matrix are passed
function R = get_block_property(mat,s_i,s_j,s_i2,s_j2)

rows = s_i2-s_i+1;
cols = s_j2-s_j+1;

%disp(rows);
%disp(cols);

vh = zeros(1,rows);
vv = zeros(1,cols);

%extract mean for each desired rows from matrix
%m/rows dimessional vector
for r = 1:rows
    temp = mean(mat(s_i+r-1,s_j:s_j2));
    vh(r) = temp;
end

%extract mean for each desired cols from matrix
%n/cols dimessional vector
for c = 1:cols
    temp = mean(mat(s_i:s_i2,s_j+c-1));
    vv(c) = temp;
end

M1 = mean(vh,2);
B1 = std2(vh);
S1 = skewness(vh);
K1 = kurtosis(vh);

M2 = mean(vv,2);
B2 = std2(vv);
S2 = skewness(vv);
K2 = kurtosis(vv);

R = [M1,B1,S1,K1,M2,B2,S2,K2];