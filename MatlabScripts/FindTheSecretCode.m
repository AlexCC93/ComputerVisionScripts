frizzy = imread('AnimatedPictureFace.png');
froomer = imread('car.png');
frizzy2=rgb2gray(frizzy);
froomer2=rgb2gray(froomer);

% TODO: Find edges in frizzy and froomer images
frizzy3=edge(frizzy2, 'canny');
froomer3=edge(froomer2, 'canny');

% TODO: Display common edge pixels
%added=frizzy3.*froomer3;
added=(frizzy3 & froomer3);
imshow(added);