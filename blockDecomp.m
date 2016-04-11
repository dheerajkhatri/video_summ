%process one frame, get 8*(4^d-1)/3 dimenssional vector for the frame

%where getProperty returns one 8 dimenssional which desribes features of
%that particular block of the frame 

function [ans1]=blockDecomp(mat, s_i, s_j, s_i2, s_j2, d, ans1)
%sprintf('%d %d %d %d',s_i,s_j,s_i2,s_j2)
%ans2=reshape(ans2,size(ans2,1)*size(ans2,2)); 
%function(mat(s_i:s_i2,s_j:s_j2));

ans2 = get_block_property(mat,s_i,s_j,s_i2,s_j2);
%ans2=[s_i; s_j; s_i2; s_j2];

ans1=[ans1; ans2];

if(d~=0)
    a1=blockDecomp(mat,s_i, s_j, s_i+floor((s_i2-s_i)/2), s_j+floor((s_j2-s_j)/2), d-1, ans1);
    ans1=a1;
    
    a2=blockDecomp(mat,s_i+floor((s_i2-s_i)/2)+1, s_j, s_i2, s_j+floor((s_j2-s_j)/2), d-1, ans1);
    ans1=a2;
    
    a3=blockDecomp(mat,s_i, s_j+floor((s_j2-s_j)/2)+1, s_i+floor((s_i2-s_i)/2), s_j2, d-1, ans1);
    ans1=a3;
    
    a4=blockDecomp(mat,s_i+floor((s_i2-s_i)/2)+1, s_j+floor((s_j2-s_j)/2)+1, s_i2, s_j2, d-1, ans1);
    ans1=a4;
end

end
