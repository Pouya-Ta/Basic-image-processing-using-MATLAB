% Read the echocardiography image
cpic = imread('echocardiography.jpg');

% Convert image to grayscale
gpic = rgb2gray(cpic);

% Display the original image and grayscale image side by side
figure;
subplot(1,2,1);
imshow(cpic);
title('Original Image');

subplot(1,2,2);
imshow(gpic);
title('Grayscale Image');

% Read an image for Fourier transform
grayImage = imread('echo_fourier_series.png');

% Perform Fourier transform and display the frequency image
frequencyImage = ifft2(grayImage);
figure;
imshow(frequencyImage);
title('Frequency Image');

% Read an image for edge detection
I = imread('echo_new.jpg');

% Convert the image to grayscale
gpic = rgb2gray(I);

% Apply Canny edge detection
BW1 = edge(gpic, 'Canny');

% Display the edge detected image
figure;
imshow(BW1);
title('Canny Edge Detection');

% Read an image for processing
I = imread('echo_new.jpg');

% Convert the image to grayscale if it has multiple color bands
[rows, columns, numberOfColorBands] = size(I);
if numberOfColorBands > 1
grayImage = I(:, :, 2);
else
grayImage = I;
end

% Display the original grayscale image
figure;
imshow(grayImage);
title('Original Grayscale Image');

% Perform Fourier transform and display the shifted spectrum image
F = fft2(grayImage);
S = fftshift(log(1+abs(F)));
figure;
imshow(S,[]);
title('Spectrum Image');

% Apply average filtering to the image
F = fspecial('average');
J1 = imfilter(I,F,900);
J2 = imfilter(I,F,100);

% Display the original image and filtered images side by side
figure;
subplot(1,3,1);
imshow(I);
title('Original Image');

subplot(1,3,2);
imshow(J1);
title('Filtered Image - Filter Size: 900');

subplot(1,3,3);
imshow(J2);
title('Filtered Image - Filter Size: 100');

% Read an image for cropping
I = imread('echocardiography.jpg');

% Crop the image and display the cropped region
figure;
imshow(I)
targetSize = [825 890];
r = centerCropWindow2d(size(I),targetSize);
J = imcrop(I,r);
figure;
imshow(J);
title('Cropped Image');

% Read an image for rotation
I = imread('echo_new.jpg');

% Rotate the image by 30 degrees using bilinear interpolation
J = imrotate(I, 30, 'bilinear');

% Display the original and rotated images side by side
figure;
imshowpair(I,J,'montage');
title('Original and Rotated Images');

% Read an image for flipping
I = imread('echo_new.jpg');

% Flip the image left/right
Ir = flipdim(I, 2);

% Display the original and flipped images side by side
figure;
subplot(1,2,1);
imshow(I);
title ('Original Image');

subplot(1,2,2);
imshow(Ir);
title ('Flipped Image');
