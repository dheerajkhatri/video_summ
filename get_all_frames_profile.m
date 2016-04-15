function brightness_depth_prop = get_all_frames_profile(d,resultFolder,luminanceMatrix,depthMatrix)

brightness_struct = load(strcat(resultFolder,'\',luminanceMatrix));
depth_struct = load(strcat(resultFolder,'\',depthMatrix));
%frame i can be accessed using brightness_struct.y{i}

frame_count = length(brightness_struct.y);
blocks = (4^d-1)/3;


brightness_depth_prop = cell(1,frame_count);

%brightness and depth struct will be struct of length 1*no_frames and each
%cell is of dimenssion [width,height]

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