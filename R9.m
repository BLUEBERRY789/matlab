% MATLAB Program using built-in test images

% Test Case 1: Using 'cameraman.tif'
img1 = imread('cameraman.tif');

% Test Case 2: Using 'rice.png'
img2 = imread('rice.png');

% Function to process images
function processImage(img, figureTitle)
    img = double(img);
    
    % LOG Transformation
    c = 1;
    log_transformed = c * log(1 + img);
    log_transformed = uint8(255 * log_transformed/max(log_transformed(:)));
    
    % Gray Level Slicing
    lower = 100;
    upper = 200;
    sliced_image = img;
    sliced_image(img >= lower & img <= upper) = 255;
    sliced_image(img < lower | img > upper) = 0;
    sliced_image = uint8(sliced_image);
    
    % Display Results
    figure('Name', figureTitle);
    subplot(1,3,1); imshow(uint8(img)); title('Original');
    subplot(1,3,2); imshow(log_transformed); title('LOG Transform');
    subplot(1,3,3); imshow(sliced_image); title('Gray Level Slicing');
end

% Process both test images
processImage(img1, 'Cameraman Image Processing');
processImage(img2, 'Rice Image Processing');