function brightness_depth_prop = get_all_frames_profile()

brightness_struct = load('..\res\10_frames_brightness.mat');
depth_struct = load('..\res\10_frames_depth.mat');
%frame i can be accessed using brightness_struct.y{i}

frame_count = length(brightness_struct.y);
d = 3;
blocks = (4^d-1)/3;


brightness_depth_prop = cell(1,frame_count);

for frame_no = 1:frame_count
    brightness_depth_prop{1,frame_no} = zeros(blocks,16);
        
    cur = brightness_struct.y{frame_no};
	rows = size(cur,1);
	cols = size(cur,2);
    
	curVector = [];
	curVector = blockDecomp(cur,1,1,rows,cols,d-1,curVector);
	brightness_depth_prop{1,frame_no}(:,1:8)  = curVector;
    
    cur = depth_struct.yd{frame_no};
    curVector = [];
	curVector = blockDecomp(cur,1,1,rows,cols,d-1,curVector);
	brightness_depth_prop{1,frame_no}(:,9:16) = curVector;                
end

