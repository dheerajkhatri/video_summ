%reading 10 frames and 
[y,u,v] = read_data('..\data\balloons1.yuv','..\data\depth_balloons1.yuv',[1024 768],10,0,'YUV420_8');

%store all properties of brightness and depth in a cell
brightness_depth_prop = get_all_frames_profile();

%convert cell to corresponding matrix on which clustering can be applied
data = prepare_data_for_clustering(brightness_depth_prop);

%find how many clusters should be taken for this shot
%kmax: 5
noClusters = compare_clusters(data,kmax);

%get exact frame number which can represent the cluster means
%frame_array = get_frame_array()

%store resulting frames in video skim
%filename:output files name
create_video_skim(y,u,v,filename,frame_array);