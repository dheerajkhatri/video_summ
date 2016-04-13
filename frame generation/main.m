function main()

nFrames = 300;
vidHeight = 1024;
vidWidth = 768;

mov = loadFileYuv('..\..\data\balloons1.yuv',vidHeight,vidWidth,1:nFrames);
for k = 1:nFrames
    imwrite(mov(k).cdata,['myImage' int2str(k) '.bmp']);
end