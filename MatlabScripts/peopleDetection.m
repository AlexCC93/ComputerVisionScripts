%% Copyright 2013 The MathWorks, Inc.
% Read input image
I = imread('visionteam.png');
size(I);
figure,imshow(I);

%% Detect upright people
peopleDetector = vision.PeopleDetector;
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);

%% Try the other model
peopleDetector = vision.PeopleDetector('ClassificationModel','UprightPeople_128x64');
peopleDetector.WindowStride = [4 4];
peopleDetector.MinSize = [256 128];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);


