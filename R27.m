% Load the image (convert to grayscale if necessary)
img = imread('cameraman.tif');  % Replace with your own image if needed
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Perform 4-level wavelet decomposition using Haar wavelet
waveletName = 'haar';  % Using Haar wavelet
[coeffs, sizes] = wavedec2(img, 4, waveletName);

% Display Approximation and Detail Coefficients for Each Level
figure;
for level = 1:4
    % Extract approximation and details for the current level
    A = appcoef2(coeffs, sizes, waveletName, level);  % Approximation
    H = detcoef2('h', coeffs, sizes, level);  % Horizontal Detail
    V = detcoef2('v', coeffs, sizes, level);  % Vertical Detail
    D = detcoef2('d', coeffs, sizes, level);  % Diagonal Detail

    % Display the coefficients
    subplot(4, 4, (level-1)*4 + 1), imshow(mat2gray(A)), title(['Approx L' num2str(level)]);
    subplot(4, 4, (level-1)*4 + 2), imshow(mat2gray(H)), title(['Horizontal L' num2str(level)]);
    subplot(4, 4, (level-1)*4 + 3), imshow(mat2gray(V)), title(['Vertical L' num2str(level)]);
    subplot(4, 4, (level-1)*4 + 4), imshow(mat2gray(D)), title(['Diagonal L' num2str(level)]);
end

% Reconstruct the image from the wavelet coefficients
img_reconstructed = waverec2(coeffs, sizes, waveletName);

% Display the original and reconstructed images
figure;
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(uint8(img_reconstructed)), title('Reconstructed Image');
