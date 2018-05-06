%%lines detection tests version
img =imread('coins.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
cannyEdges=edge(mono,'canny',0.15);
subplot(2,2,3);
imshow(cannyEdges), title('Canny edges');

radii = 15:1:40;
h = circle_hough(cannyEdges, radii, 'same', 'normalise');
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr');%para hallar las regiones donde mas se encontro intersecciones

subplot(2,2,4);
imshow(img), title('edges detected');
hold on;
for peak = peaks
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end
hold off
