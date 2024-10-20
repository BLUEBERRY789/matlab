% Read the input image
img = imread('cameraman.tif');  % Replace with your image if needed
img = im2double(img);  % Convert to double for computation

% Add 60% Salt & Pepper noise to the image
noisy_img = imnoise(img, 'salt & pepper', 0.6);

% Display the noisy image
figure;
subplot(1, 2, 1), imshow(noisy_img), title('Noisy Image (60% Salt & Pepper)');

% Define the filter size (3x3 mean filter)
filter_size = 3;
mean_filter = fspecial('average', filter_size);

% Apply mean filtering to remove noise
filtered_img = imfilter(noisy_img, mean_filter, 'replicate');

% Display the filtered image
subplot(1, 2, 2), imshow(filtered_img), title('Filtered Image (Mean Filter)');
