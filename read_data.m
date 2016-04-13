function [y,u,v] = read_data(filename,depthFileName,dims,noFrames,startingFrame,videoFormat,resultFolder,luminanceMatrix,depthMatrix)


[y,u,v] = yuv_import(filename,dims,noFrames,startingFrame,videoFormat);
[yd,ud,vd] = yuv_import(depthFileName,dims,noFrames,startingFrame,videoFormat);

save(fullfile(resultFolder,luminanceMatrix),'y','-mat');
save(fullfile(resultFolder,depthMatrix),'yd','-mat');

%read_data('..\data\balloons1.yuv','..\data\depth_balloons1.yuv',[1024 768],10,0,'YUV420_8');