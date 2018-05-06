im=imread('Pinguino.jpg');
disp(size(im));
subplot(2,2,1);
imshow(im), title('Penguin image');
im2=imread('Ugly cat.jpg');
disp(size(im2));
subplot(2,2,2);
imshow(im2), title('Ugly cat image');
result=imabsdiff(im,im2);%takes the absolute difference of im - im2 before it 
                         %gets truncated
subplot(2,2,3);
imshow(result), title('Using imabsdiff');
result2=abs(im-im2);%takes de absolute of the difference of im - im2 after it
                    %gets truncated
subplot(2,2,4);
imshow(result2), title('Using abs');
impixelinfo()
a=im(25,18)
b=im2(25,18)
imabsdiffResult=imabsdiff(a,b)
absResult=abs(a-b)