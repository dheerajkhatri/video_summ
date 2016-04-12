function [data] = prepare_data_for_clustering(brightness_depth_prop)

no_frames = length(brightness_depth_prop);
%size of matrix
[n,m] = size(brightness_depth_prop{1});
N = n*m;
data = zeros(no_frames,N);

for i = 1:no_frames
    data(i,:) = reshape(brightness_depth_prop{i}.',1,[]);
end

end