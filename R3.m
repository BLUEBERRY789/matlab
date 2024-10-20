% Create Image 1 using ones command
image1 = ones(100, 100);

% Create Image 2 using random generator command
image2 = rand(150, 150);

% Get sizes of both images
[rows1, cols1] = size(image1);
[rows2, cols2] = size(image2);

% Compare sizes
if rows1 == rows2 && cols1 == cols2
    disp('The images are of the same size.');
else
    disp('The images are of different sizes.');
    disp(['Image 1 size: ' num2str(rows1) 'x' num2str(cols1)]);
    disp(['Image 2 size: ' num2str(rows2) 'x' num2str(cols2)]);
end