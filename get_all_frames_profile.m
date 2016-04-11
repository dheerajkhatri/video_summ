function [brightness_prop,depth_prop] = get_all_frames_profile()

brightness_struct = load('res\10_frames_brightness.mat');
depth_struct = load('res\10_frames_depth.mat');
%frame i can be accessed using brightness_struct.y{i}

frame_count = length(brightness_struct.y);
d = 3;
blocks = (4^d-1)/3;

brightness_prop = cell(1,frame_count);
depth_prop = cell(1,frame_count);

for i = 1:frame_count
    brightness_prop{1,i} = zeros(blocks,8);
    depth_prop{1,i} = zeros(blocks,8);
end

for frame = 1:frame_count
	cur = brightness_struct.y{frame};
	rows = size(cur,1);
	cols = size(cur,2);
    
	curVector = [];
	curVector = blockDecomp(cur,1,1,rows,cols,d-1,curVector);
	brightness_prop{frame} = curVector;
    
    cur = depth_struct.yd{frame};
    curVector = [];
	curVector = blockDecomp(cur,1,1,rows,cols,d-1,curVector);
	depth_prop{frame} = curVector;    
end

brightness_depth_prop = cell(1,frame_count);

for i = 1:frame_count
    brightness_depth_prop{1,i} = zeros(blocks,16);
    brightness_depth_prop{1,i}(:,1:8) = brightness_prop{1,i};
    brightness_depth_prop{1,i}(:,9:16) = depth_prop{1,i};
end