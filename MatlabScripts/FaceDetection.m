%% Read the face image.
img=imread('zidane.jpg');
subplot(2,2,1);
imshow(img), title('Original face photo');

%% Face detection using CascadeObjectDetector.
detector = vision.CascadeObjectDetector;
bbox = step(detector, img);
outImg=insertObjectAnnotation(img,'rectangle',bbox,...
    'Face detected');
subplot(2,2,2);
imshow(outImg), title('Face detected in photo');

%% ------ Eyes detection
%% Read the face image.
img=imread('Image4.jpg');
figure
imshow(img), title('Original face photo');

%% Face detection using CascadeObjectDetector.
detector = vision.CascadeObjectDetector('ClassificationModel','EyePairSmall');
% detector.MergeThreshold=8;
% detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
bbox = step(detector, img);
outImg=insertObjectAnnotation(img,'rectangle',bbox,...
    'Eyes detected');
figure
% subplot(2,2,2);
imshow(outImg), title('Eyes detected in photo');

%% ------ Upperbody detection
%% Read the face image.
img=imread('people2.jpg');
figure
imshow(img), title('Original face photo');

%% Face detection using CascadeObjectDetector.
detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
detector.MergeThreshold=8; % a value that indicates whether or not, in an area
        %where there are multiple objects detected, merge into one object
        %detected and create just one simple bounding box for it.

bbox = step(detector, img);
outImg=insertObjectAnnotation(img,'rectangle',bbox,...
    'UpperBody detected');
figure
% subplot(2,2,2);
imshow(outImg), title('UpperBody detected in photo');
