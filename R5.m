% Read the input image (using a standard MATLAB test image)
img = imread('cameraman.tif');

% Convert to double for calculations
img_double = im2double(img);

% Set enhancement factor
enhancement_factor = 1.5;

% Initialize variables
[rows, cols] = size(img_double);
i = 1;

% Enhance brightness using while loop
while i <= rows
    j = 1;
    while j <= cols
        img_double(i,j) = img_double(i,j) * enhancement_factor;
        if img_double(i,j) > 1
            img_double(i,j) = 1;
        end
        j = j + 1;
    end
    i = i + 1;
end

% Display results
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(img_double);
title('Enhanced Image');