% Simple MATLAB Program for 5-level Wavelet Decomposition and Reconstruction

% Read the image
img = imread('cameraman.tif');
if size(img, 3) > 1
    img = rgb2gray(img);
end
img = double(img);

% Perform 5-level wavelet decomposition
wavelet_type = 'db2';
level = 5;
[C, S] = wavedec2(img, level, wavelet_type);

% Get approximation coefficients at level 5
A5 = appcoef2(C, S, wavelet_type, level);

% Get detail coefficients at level 5
[H5, V5, D5] = detcoef2('all', C, S, 5);

% Display decomposition results
figure;
subplot(2,2,1); imshow(uint8(img)); title('Original Image');
subplot(2,2,2); imshow(wcodemat(A5,192),[]); title('Approximation A5');
subplot(2,2,3); imshow(wcodemat(H5,192),[]); title('Horizontal Detail H5');
subplot(2,2,4); imshow(wcodemat(V5,192),[]); title('Vertical Detail V5');

% Perform reconstruction
reconstructed_img = waverec2(C, S, wavelet_type);

% Display reconstruction
figure;
subplot(1,2,1); imshow(uint8(img)); title('Original Image');
subplot(1,2,2); imshow(uint8(reconstructed_img)); title('Reconstructed Image');