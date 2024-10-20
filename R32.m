% MATLAB Program for Image Arithmetic Operations

% Read two built-in images of same size
img1 = imread('cameraman.tif');    % 256x256 grayscale image
img2 = imread('rice.png');         % Resize this to match cameraman

% Ensure images are of same size
img2 = imresize(img2, size(img1));

% Convert to double for arithmetic operations
img1 = double(img1);
img2 = double(img2);

% 1. Image Subtraction
subtracted = img1 - img2;
% Normalize to 0-255 range
subtracted = uint8(normalized(subtracted));

% 2. Image Multiplication
multiplied = img1 .* img2;
% Normalize to 0-255 range
multiplied = uint8(normalized(multiplied));

% 3. Image Division
% Add small value to avoid division by zero
epsilon = 0.0001;
divided = img1 ./ (img2 + epsilon);
% Normalize to 0-255 range
divided = uint8(normalized(divided));

% Display results
figure('Name', 'Image Arithmetic Operations');

% Original Images
subplot(2,3,1); imshow(uint8(img1)); title('Image 1');
subplot(2,3,2); imshow(uint8(img2)); title('Image 2');

% Results
subplot(2,3,4); imshow(subtracted); title('Subtraction (I1-I2)');
subplot(2,3,5); imshow(multiplied); title('Multiplication (I1*I2)');
subplot(2,3,6); imshow(divided); title('Division (I1/I2)');

% Function to normalize image to 0-255 range
function output = normalized(input)
    output = input - min(input(:));
    output = (output / max(output(:))) * 255;
end