% Load a sample hyperspectral image or RGB image for demonstration
img = imread('peppers.png');  % Replace with your hyperspectral image if available

% Convert the image to double for filtering operations
img = im2double(img);

% Add Gaussian noise to simulate a noisy hyperspectral image
noisy_img = imnoise(img, 'gaussian', 0, 0.01);

% Display the original and noisy images
figure;
subplot(1, 3, 1), imshow(img), title('Original Image');
subplot(1, 3, 2), imshow(noisy_img), title('Noisy Image');

% Get the image dimensions
[M, N, ~] = size(noisy_img);

% Design a Butterworth Low Pass Filter (BLPF)
D0 = 30;  % Cut-off frequency
n = 2;    % Order of the Butterworth filter

% Generate the Butterworth filter in the frequency domain
u = 0:(M-1);
v = 0:(N-1);
[U, V] = meshgrid(u, v);
D = sqrt((U - M/2).^2 + (V - N/2).^2);
H = 1 ./ (1 + (D ./ D0).^(2*n));  % Butterworth Low Pass Filter formula

% Apply the Butterworth filter to each channel in the frequency domain
filtered_img = zeros(size(noisy_img));
for i = 1:3  % Loop through R, G, B channels (for demonstration)
    % Compute the 2D FFT of the noisy image channel
    F = fftshift(fft2(noisy_img(:, :, i)));
    
    % Apply the filter in the frequency domain
    F_filtered = H .* F;
    
    % Compute the inverse FFT to get the filtered image channel
    filtered_img(:, :, i) = real(ifft2(ifftshift(F_filtered)));
end

% Display the filtered image
subplot(1, 3, 3), imshow(filtered_img), title('Filtered Image (BLPF)');
