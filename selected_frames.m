function [yr,ur,vr] = selected_frames(y,u,v,frame_array)

no_frames = length(frame_array);

yr = cell(1,no_frames);
ur = cell(1,no_frames);
vr = cell(1,no_frames);

for i = 1:no_frames
    yr{i} = y{frame_array(i)};
    ur{i} = u{frame_array(i)};
    vr{i} = v{frame_array(i)};
end