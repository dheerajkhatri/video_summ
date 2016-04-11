function read_data(filename,depthfilename,dims,numfrm,startfrm,yuvformat)

[y,u,v] = yuv_import(filename,dims,numfrm,startfrm,yuvformat);
[yd,ud,vd] = yuv_import(depthfilename,dims,numfrm,startfrm,yuvformat);

save(fullfile('res','10_frames_brightness.mat'),'y','-mat');
save(fullfile('res','10_frames_depth.mat'),'yd','-mat');