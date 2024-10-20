% Read the input image (using a standard MATLAB test image as an example)
% In a real scenario, you would replace this with your medical image file
img = imread('cameraman.tif');

% Convert to double for calculations
img_double = im2double(img);

% Get image dimensions
[rows, cols] = size(img_double);

% Set brightness increase factor (adjust as needed)
brightness_factor = 1.5;

% Perform brightness enhancement using for loops
for i = 1:rows
    for j = 1:cols
        % Increase pixel intensity
        enhanced_pixel = img_double(i, j) * brightness_factor;
        
        % Ensure pixel values stay within [0, 1] range
        img_double(i, j) = min(enhanced_pixel, 1);
    end
end

% Display results
figure;
subplot(1,2,1);
imshow(img);
title('Original Medical Image');
subplot(1,2,2);
imshow(img_double);
title('Enhanced Medical Image');

% Optional: Display histograms to show intensity distribution changes
figure;
subplot(2,1,1);
imhist(img);
title('Histogram of Original Image');
subplot(2,1,2);
imhist(im2uint8(img_double));
title('Histogram of Enhanced Image');

% Optional: Calculate and display improvement in average brightness
original_brightness = mean(img(:));
enhanced_brightness = mean(img_double(:));
brightness_increase = (enhanced_brightness - original_brightness) / original_brightness * 100;

fprintf('Average brightness increased by %.2f%%\n', brightness_increase);