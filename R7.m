% Read the input image (using a standard MATLAB test image as an example)
% In a real scenario, replace this with your low contrast medical image
img = imread('cameraman.tif');

% Convert to double for calculations
img_double = im2double(img);

% (a) Generate the Negative of the input image
img_negative = 1 - img_double;

% (b) Perform Gray Level Slicing
% Define the range for slicing (adjust these values as needed)
lower_threshold = 0.3;
upper_threshold = 0.7;

% Create a mask for the specified gray level range
mask = (img_double >= lower_threshold) & (img_double <= upper_threshold);

% Create the sliced image
img_sliced = img_double;
img_sliced(mask) = 1;  % Set to white (1) within the range
img_sliced(~mask) = 0; % Set to black (0) outside the range

% Display results
figure;

% Original Image
subplot(1,3,1);
imshow(img);
title('Original Low Contrast Image');

% Negative Image
subplot(1,3,2);
imshow(img_negative);
title('(a) Negative Image');

% Gray Level Sliced Image
subplot(1,3,3);
imshow(img_sliced);
title('(b) Gray Level Sliced Image');

% Optional: Save the processed images
imwrite(img_negative, 'negative_image.png');
imwrite(img_sliced, 'sliced_image.png');

fprintf('Processing complete. Images have been displayed and saved.\n');