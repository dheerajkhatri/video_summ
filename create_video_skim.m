function create_video_skim(y,u,v,filename,frame_array)
no_frames = length(frame_array);
[yr,ur,vr] = selected_frames(y,u,v,frame_array);
yuv_export(yr,ur,vr,filename,no_frames,'w');