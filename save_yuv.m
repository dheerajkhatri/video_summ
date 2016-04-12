function [ siz ] = save_yuv( filename,Y,U,V,format)

    fileId = fopen(filename,'w');
    if fileId>=0
        %display('postive file id');
        fclose(fileId);
        siz=0;
        [framenumber,height,width]=size(Y);
        fwidth = 0.5;
        fheight= 0.5;
        if strcmp(format,'400')
            fwidth = 0;
            fheight= 0;
        elseif strcmp(format,'411')
            fwidth = 0.25;
            fheight= 1;
        elseif strcmp(format,'420')
            fwidth = 0.5;
            fheight= 0.5;
        elseif strcmp(format,'422')
            fwidth = 0.5;
            fheight= 1;
        elseif strcmp(format,'444')
            fwidth = 1;
            fheight= 1;
        else
            display('Error: wrong format');
        end
        h = waitbar(0,'Saving File Please Wait ... ');
        for cntf = 1:framenumber
            waitbar(cntf/framenumber,h);
            y(:,:)=Y(cntf,:,:);
            if fheight==0
                u=0;
                v=0;
            else
                u(:,:)=U(cntf,:,:);
                v(:,:)=V(cntf,:,:);
            end
            [chk] = SaveFileYUV(y,u,v,width,height,cntf,filename,fheight,fwidth);
            




        end
        close(h)
        filep = dir(filename);
        siz = filep.bytes; %Filesize
        clear filep
    end
    
end

function[chk]=SaveFileYUV(y,u,v,width,height,cntf,filename,fheight,fwidth)
    fileId = fopen(filename,'a');
    HX=height*fheight;
    WX=width*fwidth;
    for j=1:height
        %             yy(1:width,1:height)=Y(i,:,:);
        %             YY=uint8(reshape(yy,1,yb));
        fwrite(fileId,y(j,1:width),'uchar');
    end
    if HX~=0
        for j=1:HX
            %             yy(1:width,1:height)=Y(i,:,:);
            %             YY=uint8(reshape(yy,1,yb));
            fwrite(fileId,u(j,1:WX),'uchar');
        end
        for j=1:HX
            %             yy(1:width,1:height)=Y(i,:,:);
            %             YY=uint8(reshape(yy,1,yb));
            fwrite(fileId,v(j,1:WX),'uchar');
        end
    end
    fclose(fileId);
    chk=1;

end