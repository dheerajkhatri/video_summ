function video_summ()

video1 = '..\data\balloons1.yuv';
video2 = '..\data\depth_balloons1.yuv';
width = 1024;
height = 768;
noFrames = 50;
startingFrame = 0;
videoFormat = 'YUV420_8';
resultFolder = '..\res';
luminanceMatrix = '50_frames_brightness.mat';
depthMatrix  = '50_frames_depth.mat';
skimVideoName = '..\res\skim.yuv';

[y,u,v] = yuv_import(video1,dims,noFrames,startingFrame,videoFormat);
[yd,ud,vd] = yuv_import(depthFileName,dims,noFrames,startingFrame,videoFormat);