% MATLAB Program for Bitwise Operations on Images

% Read input image
img1 = imread('cameraman.tif');
img2 = imread('rice.png');

% Ensure images are same size
img2 = imresize(img2, size(img1));

% Convert images to binary for bitwise operations
threshold = graythresh(img1);
binary_img1 = imbinarize(img1, threshold);
binary_img2 = imbinarize(img2, threshold);

% 1. Bitwise AND Operation
and_result = binary_img1 & binary_img2;

% 2. Bitwise XOR Operation
xor_result = xor(binary_img1, binary_img2);

% 3. Bitwise COMPLEMENT Operation
complement_img1 = ~binary_img1;
complement_img2 = ~binary_img2;

% Display all results using subplot
figure('Name', 'Bitwise Operations on Images');

% Original Images
subplot(3,2,1);
imshow(binary_img1);
title('Binary Image 1');

subplot(3,2,2);
imshow(binary_img2);
title('Binary Image 2');

% AND Operation
subplot(3,2,3);
imshow(and_result);
title('Bitwise AND');

% XOR Operation
subplot(3,2,4);
imshow(xor_result);
title('Bitwise XOR');

% COMPLEMENT Operations
subplot(3,2,5);
imshow(complement_img1);
title('Complement of Image 1');

subplot(3,2,6);
imshow(complement_img2);
title('Complement of Image 2');