clear all
clc

coins = imread('coins.png');
flipCoins = zeros(size(coins,1), size(coins, 2));
middle = size(coins,2)/2;
for r=1:size(coins,1)
    for c=1:middle
        dist = middle - c;
        flipCoins(r, c) = coins(r, middle+dist);
        flipCoins(r, middle+dist) = coins(r, c);
    end
end

imshowpair(coins, flipCoins, 'montage')