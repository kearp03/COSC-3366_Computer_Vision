clear all
clc

vidObj = VideoReader('myVideo.avi');

reference = imread('frameReference.jpg');

figure
imshow(reference)
[xs, ys] = getpts;
xs = uint64(xs);
ys = uint64(ys);
book = reference(min(ys):max(ys), min(xs):max(xs));
figure; imshow(book)

%Detect Point Features
bookPoints = detectSURFFeatures(book);
% figure;
% imshow(book);
% title('100 Strongest Point Features from Box Image');
% hold on;
% plot(selectStrongest(boxPoints, 100));

%Extract Feature Descriptors
[bookFeatures, bookPoints] = extractFeatures(book, bookPoints);

while hasFrame(vidObj)
    %Read in current frame
    frame = readFrame(vidObj);
    
    %Detect Point Features
    scenePoints = detectSURFFeatures(rgb2gray(frame));
    % figure;
    % imshow(frame);
    % title('300 Strongest Point Features from Scene Image');
    % hold on;
    % plot(selectStrongest(scenePoints, 300));
    
    %Extract Feature Descriptors
    [sceneFeatures, scenePoints] = extractFeatures(rgb2gray(frame), scenePoints);

    %Find Putative Point Matches
    bookpairs = matchFeatures(bookFeatures, sceneFeatures);

    matchedBookPoints = bookPoints(bookpairs(:, 1), :);
    matchedScenePoints = scenePoints(bookpairs(:, 2), :);
    % figure;
    % showMatchedFeatures(book, frame, matchedBoxPoints, matchedScenePoints, 'montage');
    % title('Putatively Matched Points (Including Outliers)');

    %Locate the Object in the Scene Using Putative Matches
    try
        [tform, inlierIdx] = estgeotform2d(matchedBookPoints, matchedScenePoints, 'affine');
    catch
        continue
    end
    inlierBoxPoints   = matchedBookPoints(inlierIdx, :);
    inlierScenePoints = matchedScenePoints(inlierIdx, :);

    % figure;
    % showMatchedFeatures(book, frame, inlierBoxPoints, inlierScenePoints, 'montage');
    % title('Matched Points (Inliers Only)');

    boxPolygon = [1, 1;...                           % top-left
        size(book, 2), 1;...                 % top-right
        size(book, 2), size(book, 1);... % bottom-right
        1, size(book, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon

    newBoxPolygon = transformPointsForward(tform, boxPolygon);

    figure;
    imshow(frame);
    hold on;
    line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), Color='y');
    title('Detected Box');
end
