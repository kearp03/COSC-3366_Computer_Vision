clear all
clc

I = imread('coins.png');
vars = zeros(256, 1);
for i=0:255
    % initialize means and counts
    meanb = 0.0;
    meanf = 0.0;
    wb = 0.0;
    wf = 0.0;
    % iterate through image
    for r=1:size(I, 1)
        for c=1:size(I, 2)
            % if less than or equal threshold, is a background pixel
            if(I(r,c) <= i)
                meanb = double(meanb) + double(I(r,c));
                wb = wb + 1;
            % else it's a foreground pixel
            else
                meanf = double(meanf) + double(I(r,c));
                wf = wf + 1;
            end
        end
    end
    % if no background pixels, set mean to 0
    if wb == 0
        meanb = 0;
    else
        meanb = meanb/wb;
    end
    % if no foreground pixels, set mean to 0
    if wf == 0
        meanf = 0;
    else
        meanf = meanf/wf;
    end
    % calculate proportions
    wb = wb/(size(I,1)*size(I,2));
    wf = wf/(size(I,1)*size(I,2));
    % add variance to array
    vars(i+1) = wb*wf*(meanb - meanf)^2;
end

% find the index of the maximum variance
[~, maxIndex] = max(vars);
% fix off by one error
maxIndex = maxIndex-1;

disp(['The threshold value is ', num2str(maxIndex)])