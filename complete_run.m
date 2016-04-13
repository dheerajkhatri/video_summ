function complete_run()

filename = '..\data\balloons1.yuv';
depthFileName = '..\data\depth_balloons1.yuv';
width = 1024;
height = 768;
noFrames = 20;
startingFrame = 0;
videoFormat = 'YUV420_8';
resultFolder = '..\res';
luminanceMatrix = '20_frames_brightness.mat';
depthMatrix  = '20_frames_depth.mat';
skimVideoName = '..\res\skim.yuv';

[y,u,v] = read_data(filename,depthFileName,[width,height],noFrames,startingFrame,videoFormat,resultFolder,luminanceMatrix,depthMatrix);

display('luminance and disparity matrix has been generated....');

%store all properties of brightness and depth in a cell
d = 5;
brightness_depth_prop = get_all_frames_profile(d,resultFolder,luminanceMatrix,depthMatrix);
display('final feature matrix has been generated....');

%convert cell to corresponding matrix on which clustering can be applied
data = prepare_data_for_clustering(brightness_depth_prop);
display('data has been prepared for clustering....');

%find how many clusters should be taken for this shot and
%get exact frame number which can represent the cluster means
%kmax: 5
kmax = 5;
key_frames = get_key_frames(data,kmax);
display('key frames from shot has been obtained');

%store resulting frames in video skim
%filename:output files name
create_video_skim(y,u,v,skimVideoName,key_frames);
display('video skim has been generated in res folder');