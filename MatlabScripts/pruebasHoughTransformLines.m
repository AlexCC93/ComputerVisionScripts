%% Read the image
img =imread('car.png');
subplot(2,2,1);
imshow(img), title('Original image');
%% Detecting edges (canny)
mono=rgb2gray(img);
subplot(2,2,2);
cannyEdges=edge(mono,'canny');
subplot(2,2,2);
imshow(cannyEdges), title('Canny edges');
%% Detecting lines, applying hough transform
[accum theta rho] = hough(cannyEdges);
subplot(2,2,3);
imagesc(accum, 'XData',theta,'YData',rho), title('Hough accumulator');
peaks = houghpeaks(accum, 100); % detect the peaks in the accum matrix, and it 
        %will get as maximumu 100 values.
hold on; plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');
hold off;
%% Making and drawing the line segments
line_segments=houghlines(cannyEdges,theta,rho, peaks);
subplot(2,2,4);
imshow(img), title('detected lines'), hold on;
for k=1:length(line_segments)
    endpoints = [line_segments(k).point1;line_segments(k).point2];
    plot(endpoints(:,1),endpoints(:,2),'Linewidth',2,'Color','green');
end
% hold off;




%% Lines detection tests version, read the image.
img =imread('gantrycrane.png');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
%% apply hough transform, and visualize the position where there are lines.
mono=rgb2gray(img);
cannyEdges=edge(mono,'canny');
subplot(2,2,2);
imshow(cannyEdges), title('Canny edges');
[accum theta rho] = hough(cannyEdges);
subplot(2,2,3);
imagesc(accum,'XData',theta,'YData',rho), title('Hough accumulator');%images
                    %with scaled colors
%% Identify the peaks and plot them
peaks = houghpeaks(accum, 50,'Threshold',ceil(0.6*max(accum(:))),'NHoodSize',[5 5]);
        %Funtion with extra parameters to make the lines detection appropiate
        % to this particular case. 
size(peaks);
hold on; 
plot(theta(peaks(:,2)),rho(peaks(:,1)),'rs');
colormap(hot);
hold off;

% subplot(2,2,4);
% imshow(accum, 'XData',theta,'YData',rho), title('Hough accumulator');
%% making and draw the found lines
line_segments=houghlines(cannyEdges,theta,rho,peaks);
% line_segments(1).point1
% line_segments(1).point2
% impixelinfo()
subplot(2,2,4);
imshow(img), title('Detected lines'), hold on;
for k=1:length(line_segments)
    endpoints = [line_segments(k).point1;line_segments(k).point2];
    plot(endpoints(:,1),endpoints(:,2),'Linewidth',2,'Color','green');
end
hold off;

% 
% x = [5 8];
% y = [3 6];
% C = [0 2 4 6; 8 10 12 14; 16 18 20 220];
% imagesc(x,y,C)
% impixelinfo()
