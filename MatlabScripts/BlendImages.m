%%Blend 2 images
function BlendImages() %combines two images indicating the percentage of 
            % showness of one the images.
im=imread('Pinguino.jpg');
disp(size(im));
subplot(2,2,1);
imshow(im);
im2=imread('Ugly cat.jpg');
disp(size(im2));
subplot(2,2,2);
imshow(im2);
result=blend(im,im2,0.25);
subplot(2,2,3);
imshow(result);
impixelinfo()
end
function x = blend(image1,image2,value)
    x=image1*value+image2*(1-value);
end






