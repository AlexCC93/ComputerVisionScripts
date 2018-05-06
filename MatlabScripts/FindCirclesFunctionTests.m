%% Circles detection example
img =imread('coins2.png');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
[centers, radii] = imfindcircles(mono,[15 30]);
size(centers)
% [centers, radii, metric] = imfindcircles(mono,[15 30]);%metric contains
        %the magnitudes of the accumulator array peaks for each circle (in descending order). 
centers5 = centers(1:5,:);%select the centers of the first 5 circles detected.
radii5 = radii(1:5);
% metricStrong5 = metric(1:5);
viscircles(centers5, radii5,'EdgeColor','b'); %%draws a circle
                %in the given position with a given radius
