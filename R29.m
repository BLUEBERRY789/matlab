% MATLAB Program for Mean Filter Enhancement with Gaussian Noise

% Read input image
img = imread('cameraman.tif');
img = double(img)/255;  % Normalize to [0,1] range

% Add 60% Gaussian noise
noise_mean = 0;
noise_var = 0.6;  % 60% noise
noisy_img = imnoise(img, 'gaussian', noise_mean, noise_var);

% Apply mean filter
filter_size = 3;  % 3x3 filter
mean_filter = ones(filter_size) / (filter_size^2);
filtered_img = imfilter(noisy_img, mean_filter, 'replicate');

% Display results
figure('Name', 'Image Enhancement using Mean Filter');

% Original Image
subplot(2,2,1);
imshow(img);
title('Original Image');

% Noisy Image
subplot(2,2,2);
imshow(noisy_img);
title('Image with 60% Gaussian Noise');

% Filtered Image
subplot(2,2,3);
imshow(filtered_img);
title('Mean Filtered Image');

% Display MSE and PSNR
mse = immse(filtered_img, img);
psnr = 10 * log10(1/mse);

% Add text annotation for metrics
text_str = sprintf('MSE: %.4f\nPSNR: %.2f dB', mse, psnr);
subplot(2,2,4);
text(0.1, 0.5, text_str, 'FontSize', 12);
axis off;
title('Quality Metrics');

% Display histograms of all images
figure('Name', 'Histograms');
subplot(1,3,1);
histogram(img(:), 50);
title('Original Histogram');
subplot(1,3,2);
histogram(noisy_img(:), 50);
title('Noisy Image Histogram');
subplot(1,3,3);
histogram(filtered_img(:), 50);
title('Filtered Image Histogram');