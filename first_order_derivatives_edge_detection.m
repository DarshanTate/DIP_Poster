% Read the image
image = imread('image.jpg');
grayImage = rgb2gray(image); % Convert to grayscale if needed

% Roberts Cross Operator
robertsX = [1 0; 0 -1];
robertsY = [0 1; -1 0];
edgeRobertsX = imfilter(double(grayImage), robertsX, 'replicate');
edgeRobertsY = imfilter(double(grayImage), robertsY, 'replicate');
edgeRoberts = sqrt(edgeRobertsX.^2 + edgeRobertsY.^2);

% Sobel Operator
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = [-1 -2 -1; 0 0 0; 1 2 1];
edgeSobelX = imfilter(double(grayImage), sobelX, 'replicate');
edgeSobelY = imfilter(double(grayImage), sobelY, 'replicate');
edgeSobel = sqrt(edgeSobelX.^2 + edgeSobelY.^2);

% Prewitt Operator
prewittX = [-1 0 1; -1 0 1; -1 0 1];
prewittY = [-1 -1 -1; 0 0 0; 1 1 1];
edgePrewittX = imfilter(double(grayImage), prewittX, 'replicate');
edgePrewittY = imfilter(double(grayImage), prewittY, 'replicate');
edgePrewitt = sqrt(edgePrewittX.^2 + edgePrewittY.^2);

% Display results
figure;
subplot(2,2,1); imshow(grayImage); title('Original Image');
subplot(2,2,2); imshow(edgeRoberts, []); title('Roberts Edge Detection');
subplot(2,2,3); imshow(edgeSobel, []); title('Sobel Edge Detection');
subplot(2,2,4); imshow(edgePrewitt, []); title('Prewitt Edge Detection');
