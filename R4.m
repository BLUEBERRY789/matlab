% Read the input image (using a standard MATLAB test image)
img = imread('cameraman.tif');

% Case 1: Display gray image
figure;
subplot(2,2,1);
imshow(img);
title('Original Grayscale Image');

% Case 2: Display histogram
subplot(2,2,2);
imhist(img);
title('Histogram');

% Case 3: Display binary image
threshold = graythresh(img);
binary_img = imbinarize(img, threshold);
subplot(2,2,3);
imshow(binary_img);
title('Binary Image');