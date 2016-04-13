function create_video_skim(y,u,v,skimVideoName,key_frames)

no_frames = length(key_frames);

yr = cell(1,no_frames);
ur = cell(1,no_frames);
vr = cell(1,no_frames);

for i = 1:no_frames
    yr{i} = y{key_frames(i)};
    ur{i} = u{key_frames(i)};
    vr{i} = v{key_frames(i)};
end

yuv_export(yr,ur,vr,skimVideoName,no_frames,'w');