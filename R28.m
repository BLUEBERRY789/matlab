% Load Image 1 and Image 2
img1 = imread('pout.tif');  % Replace with your first image
img2 = imread('cameraman.tif');  % Replace with your second image

% Convert to grayscale if the images are RGB
if size(img1, 3) == 3
    img1_gray = rgb2gray(img1);
else
    img1_gray = img1;
end

if size(img2, 3) == 3
    img2_gray = rgb2gray(img2);
else
    img2_gray = img2;
end

% Perform Histogram Equalization on both images
img1_eq = histeq(img1_gray);
img2_eq = histeq(img2_gray);

% Display the original and enhanced images side by side
figure;

% Original Images
subplot(2, 4, 1), imshow(img1_gray), title('Original Image 1');
subplot(2, 4, 2), imhist(img1_gray), title('Histogram of Image 1');
subplot(2, 4, 3), imshow(img2_gray), title('Original Image 2');
subplot(2, 4, 4), imhist(img2_gray), title('Histogram of Image 2');

% Enhanced Images after Histogram Equalization
subplot(2, 4, 5), imshow(img1_eq), title('Equalized Image 1');
subplot(2, 4, 6), imhist(img1_eq), title('Histogram of Equalized Image 1');
subplot(2, 4, 7), imshow(img2_eq), title('Equalized Image 2');
subplot(2, 4, 8), imhist(img2_eq), title('Histogram of Equalized Image 2');

% Optionally save the enhanced images
imwrite(img1_eq, 'image1_equalized.jpg');
imwrite(img2_eq, 'image2_equalized.jpg');
