%% Gaussian distribution basic
noise = randn([1 10])
[n,x]=hist(noise, [-7:1:7])%creates a histogram of the indicated rank -7 to 7 
            % with the random generated numbers.
disp([x;n]);
plot(x,n);

%% Gaussian distribution 
noise = randn([1 10000000]);
[n,x]=hist(noise, [-7:0.1:7]);
% disp([x;n]);
plot(x,n);

%% Generating gaussian noise, but not running. It is running (24/04/18)
im=imread('Albert Einstein.jpg');
im2=im2double(im);
disp(size(im2));
disp(class(im2));
subplot(2,2,1);
imshow(im), title('Original image');
noise = randn(size(im))*0.01; %Changing the factor of multiplication will 
            % affect in how noisy gets the image. This would be the variance
            % parameter in the imnoise funtcion 
disp(size(noise));
disp(class(noise));
result=im2 + noise;
subplot(2,2,2);
imshow(result), title('Image with Gaussian noise');

%% Using the imnoise function
im = imread('Albert Einstein.jpg');
subplot(1,2,1);
imshow(im);
title('Original image');
J = imnoise(im,'gaussian',0,0.01);% the function imnoise lets you choose the 
               %type of noise wanted, the other parameters are the mean and
               %variance of the noise.
subplot(1,2,2);
imshow(J);
title('Image with noise');

%% Salt and pepper noise 
im = imread('Albert Einstein.jpg');
subplot(1,2,1);
imshow(im);
title('Original image');
J = imnoise(im,'salt & pepper');
subplot(1,2,2);
imshow(J);
title('Image with noise salt and pepper');