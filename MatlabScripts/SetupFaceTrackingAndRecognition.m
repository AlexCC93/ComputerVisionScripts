% Create the face detector object.
faceDetector = vision.CascadeObjectDetector();

% Create the point tracker object. This tracks a set of points in a video.
pointTracker = vision.PointTracker('MaxBidirectionalError', 2); % Takes the 
            %error between a point being tracked from the previous frame to
            %the actual frame and to the previous frame again. If this
            %error es above the number given then this point is no
            %trackable.

% Create the webcam object.

cam = webcam('FaceCam 1020')

% Capture one frame to get its size.
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]); % [left bottom width height]. 
% videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2)+30,
% frameSize(1)+30]]);  Think this is the same

%% Detecting and Tracking

runLoop = true;
numPts = 0; %number of feature points detected in a frame
frameCount = 0;

while runLoop && frameCount < 400

    % Get the next frame.
    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;

    if numPts < 10
        % Detection mode.
        bbox = faceDetector.step(videoFrameGray);%bbox is an mx4 matrix  
                    %which contains the coordinates in the form 
                    %[x y width height], beginning in the upper left corner,
                    %of the detected faces in the image.
        %bbox = step(faceDetector, videoFrameGray);I think this is the same 
        if ~isempty(bbox) %if the bbox matrix is not empty...
            % Find corner points inside the detected region.
            points = detectMinEigenFeatures(videoFrameGray, 'ROI', bbox(1, :));
            %it uses the minimum EigenValue algorithm to find feature
            %points within the ROI. In points it is saved a cornerPoints 
            %object that contains information about the feature points
            %detected.
            
            % Re-initialize the point tracker.
            xyPoints = points.Location; %M-by-2 array of [x y] point 
                                        %coordinates. Coordinates of the
                                        %feature points.
            numPts = size(xyPoints,1);
            release(pointTracker); %release the interface and all resources
                           %used by the interface. Kind of stop the
                           %pointTracker.
            initialize(pointTracker, xyPoints, videoFrameGray);

            % Save a copy of the points.
            oldPoints = xyPoints;

            % Convert the rectangle represented as [x, y, w, h] into an
            % M-by-2 matrix of [x,y] coordinates of the four corners. This
            % is needed to be able to transform the bounding box to display
            % the orientation of the face.
            bboxPoints = bbox2points(bbox(1, :));

            % Convert the box corners into the [x1 y1 x2 y2 x3 y3 x4 y4]
            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);%bboxPoints' creates 
                        %column vector of its components.

            % Display a bounding box around the detected face.
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);

            % Display detected corners.
%             videoFrame = insertMarker(videoFrame, xyPoints, '+', 'Color', 'white');
        end

    else
        % Tracking mode.
        [xyPoints, isFound] = step(pointTracker, videoFrameGray); % tracks the
                        % points in the input frame. In xyPoints it is saved the
                        % new positions of the points. isFound is a boolean
                        % array that dictates whether or not each point has
                        % been tracked.
        visiblePoints = xyPoints(isFound, :);%Takes only the points that have 
                        % been tracked. The ones that have true in the
                        % isFound column vector.
        oldInliers = oldPoints(isFound, :);% Takes only the points with true 
                        %in the isFound column vector. But this is from the
                        %old points.
        numPts = size(visiblePoints, 1);

        if numPts >= 10
            % Estimate the geometric transformation between the old points
            % and the new points.
            [xform, oldInliers, visiblePoints] = estimateGeometricTransform(...
                oldInliers, visiblePoints, 'similarity', 'MaxDistance', 4);

            % Apply the transformation to the bounding box.
            bboxPoints = transformPointsForward(xform, bboxPoints);

            % Convert the box corners into the [x1 y1 x2 y2 x3 y3 x4 y4]
            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);

            % Display a bounding box around the face being tracked.
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);

            % Display tracked points.
%             videoFrame = insertMarker(videoFrame, visiblePoints, '+', 'Color', 'white');

            % Reset the points.
            oldPoints = visiblePoints;
            setPoints(pointTracker, oldPoints); %set points for tracking
        end

    end

    % Display the annotated video frame using the video player object.
    step(videoPlayer, videoFrame);

    % Check whether the video player window has been closed.
    runLoop = isOpen(videoPlayer);
end

% Clean up.
clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);