% Load a sample image (replace with your assembly line image if available)
img = imread('circuit.tif');  % Using a built-in MATLAB image as an example

% Display the original image
figure;
imshow(img);
title('Original Image');

% Let user select a pixel
disp('Click on a pixel in the image to analyze its neighborhood.');
[col, row] = ginput(1);
row = round(row);
col = round(col);

% Function to get N4 neighbors
function n4 = getN4Neighbors(img, row, col)
    [m, n] = size(img);
    n4 = [];
    if row > 1,  n4 = [n4; row-1, col]; end
    if row < m,  n4 = [n4; row+1, col]; end
    if col > 1,  n4 = [n4; row, col-1]; end
    if col < n,  n4 = [n4; row, col+1]; end
end

% Function to get N8 neighbors
function n8 = getN8Neighbors(img, row, col)
    [m, n] = size(img);
    n8 = getN4Neighbors(img, row, col);
    if row > 1 && col > 1,    n8 = [n8; row-1, col-1]; end
    if row > 1 && col < n,    n8 = [n8; row-1, col+1]; end
    if row < m && col > 1,    n8 = [n8; row+1, col-1]; end
    if row < m && col < n,    n8 = [n8; row+1, col+1]; end
end

% Function to get ND (diagonal) neighbors
function nd = getNDNeighbors(img, row, col)
    [m, n] = size(img);
    nd = [];
    if row > 1 && col > 1,    nd = [nd; row-1, col-1]; end
    if row > 1 && col < n,    nd = [nd; row-1, col+1]; end
    if row < m && col > 1,    nd = [nd; row+1, col-1]; end
    if row < m && col < n,    nd = [nd; row+1, col+1]; end
end

% Get neighbors
n4 = getN4Neighbors(img, row, col);
n8 = getN8Neighbors(img, row, col);
nd = getNDNeighbors(img, row, col);

% Create a visualization of the neighborhoods
vis_img = img;
vis_img = repmat(vis_img, [1 1 3]);  % Convert to RGB for colored visualization

% Mark the selected pixel
vis_img(row, col, :) = [255, 0, 0];  % Red

% Mark N4 neighbors
for i = 1:size(n4, 1)
    vis_img(n4(i,1), n4(i,2), :) = [0, 255, 0];  % Green
end

% Mark ND neighbors
for i = 1:size(nd, 1)
    vis_img(nd(i,1), nd(i,2), :) = [0, 0, 255];  % Blue
end

% Display the result
figure;
imshow(vis_img);
title('Pixel Neighborhood');
legend('Selected Pixel', 'N4 Neighbors', 'ND Neighbors');

% Print neighbor coordinates
disp('N4 Neighbors:');
disp(n4);
disp('N8 Neighbors:');
disp(n8);
disp('ND Neighbors:');
disp(nd);