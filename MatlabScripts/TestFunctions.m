function TestFunctions()
    im=imread('Pinguino.jpg');
    disp(size(im));
    subplot(2,2,1);
    imshow(im);
    img2=multiplyFunction(im,8.25);
    subplot(2,2,2);
    imshow(img2);
    impixelinfo()
end

function x = multiplyFunction(image,value)
    x=image*value;
end