% MATLAB Program for Image Conversion and Enhancement

% Read color image
% Using 'peppers.png' as it's a standard color image in MATLAB
img = imread('peppers.png');

% Convert to grayscale
gray_img = rgb2gray(img);

% Convert to binary
% Using Otsu's method for thresholding
threshold = graythresh(gray_img);
binary_img = imbinarize(gray_img, threshold);

% Enhance image using imadjust
% Default enhancement
enhanced_img1 = imadjust(gray_img);

% Custom enhancement with specified ranges
enhanced_img2 = imadjust(gray_img, [0.2 0.8], [0 1]);  % Enhance mid-tones

% Display results
figure('Name', 'Image Conversion and Enhancement');

% Original Color Image
subplot(2,3,1);
imshow(img);
title('Original Color Image');

% Grayscale Image
subplot(2,3,2);
imshow(gray_img);
title('Grayscale Image');

% Binary Image
subplot(2,3,3);
imshow(binary_img);
title('Binary Image');

% Enhanced Images
subplot(2,3,4);
imshow(enhanced_img1);
title('Default Enhancement');

subplot(2,3,5);
imshow(enhanced_img2);
title('Custom Enhancement');

% Display histograms
subplot(2,3,6);
imhist(gray_img);
title('Histogram of Grayscale Image');

% Print basic image information
fprintf('Image size: %d x %d\n', size(gray_img, 1), size(gray_img, 2));
fprintf('Threshold value used for binary conversion: %f\n', threshold);