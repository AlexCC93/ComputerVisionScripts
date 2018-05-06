%% People recognition (NOT WORKING) not sure if there is scaleFactor in this 
%object (PeopleDetector)
I = imread('people.png');
size(I);
% figure,imshow(I);
% Detect upright people
peopleDetector1 = vision.PeopleDetector('ClassificationModel','UprightPeople_96x48');
[bboxes1, scores1] = step(peopleDetector1,I);
I_people1 = insertObjectAnnotation(I,'rectangle',bboxes1,scores1);
figure, imshow(I_people1);
%% Try the other model
peopleDetector = vision.PeopleDetector('ClassificationModel','UprightPeople_96x48','ClassificationThreshold',2);
peopleDetector.WindowStride = [2 2];
% peopleDetector.MinSize = [96 100];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);
%% Try the other model
peopleDetector = vision.PeopleDetector('ClassificationModel','UprightPeople_96x48');
peopleDetector.WindowStride = [2 2];
peopleDetector.MinSize = [96 100];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);
% Try the other model
peopleDetector = vision.PeopleDetector('ClassificationModel','UprightPeople_96x48');
peopleDetector.MinSize = [96 95];
peopleDetector.WindowStride = [2 2];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);

%----------------------------With another image (NOT WORKING)
%% People recognition
I = imread('people2.jpg');
size(I)
% figure,imshow(I);
peopleDetector = vision.PeopleDetector();
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);
%% try other model
peopleDetector = vision.PeopleDetector();
peopleDetector.MinSize = [128 200];
peopleDetector.WindowStride = [2 2];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);


%% ----------------------------With another image (WORKING)
% People recognition
I = imread('people3.jpg');
size(I)
figure,imshow(I);
peopleDetector = vision.PeopleDetector();
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);
% try other model
peopleDetector = vision.PeopleDetector();
peopleDetector.ClassificationModel='UprightPeople_96x48';
peopleDetector.MinSize = [280 60];
[bboxes, scores] = step(peopleDetector,I);
I_people = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I_people);
impixelinfo()