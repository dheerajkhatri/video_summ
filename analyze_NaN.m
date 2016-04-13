%analysing NaN presence in the data
function nans = analyze_NaN(data)

[n,m] = size(data);
nans = zeros(1,n);

for i = 1:n
    count = 0;
    for j = 1:m
        if (isnan(data(i,j)))
            count = count + 1;
        end
    end
    nans(1,i) = count;
end

%NaN containing frames = sum(analyze_NaN(data) > 0)