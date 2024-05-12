vidObj = VideoReader('xylophone.mp4');

while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    imshow(vidFrame)
end