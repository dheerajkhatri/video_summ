%ip:2 steroscopic video channels and no of frames to be processed in video
%op:stores and returns cell array of disparityMap (1*noFrames)
%each cell is of size width*height [1024*768] in our case

function disparityMap = generate_disparity_map(video1,video2,noFrames)

vidWidth = 1024;
vidHeight = 768;
disparityMap = cell(1,noFrames);

mov1 = loadFileYuv(video1,vidWidth,vidHeight,1:noFrames);
mov2 = loadFileYuv(video2,vidWidth,vidHeight,1:noFrames);

for i = 1:noFrames
    I1 = mov1(i).cdata;
    I2 = mov2(i).cdata;    

    %to store the image use:
    %imwrite(mov(k).cdata,['image' int2str(i) '.png']);
    
    I1g = rgb2gray(I1);
    I2g = rgb2gray(I2);
    
    disparityMap{1,i} = disparity(I1g,I2g);
end

save('disparityMap.mat','disparityMap');