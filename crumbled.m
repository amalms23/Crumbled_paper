% Task 1: Edge Detection in Crumpled Paper Image
% Load and preprocess the image
crumpledPaperPath = 'crumpled_paper.jpg'; % Replace with your actual image path
crumpledImg = imread(crumpledPaperPath);
if size(crumpledImg, 3) == 3
    grayCrumpledImg = rgb2gray(crumpledImg); % Convert to grayscale
else
    grayCrumpledImg = crumpledImg; % Already grayscale
end

% Enhance contrast to better detect crumples
enhancedCrumpledImg = imadjust(grayCrumpledImg);

% Edge detection using the Canny method
edgesCrumpled = edge(enhancedCrumpledImg, 'Canny');

% Display the original and detected edges
figure;
subplot(1, 2, 1);
imshow(crumpledImg);
title('Original Crumpled Paper Image');

subplot(1, 2, 2);
imshow(edgesCrumpled);
title('Detected Crumple Lines');

% Save the black-and-white edges image as blackdot.jpg
imwrite(edgesCrumpled, 'blackdot.jpg');
disp('The detected edges image has been saved as blackdot.jpg');

% Optional: Highlight detected edges on the original image
highlightedCrumpledImg = crumpledImg;
if size(highlightedCrumpledImg, 3) == 3
    highlightedCrumpledImg(:, :, 1) = uint8(double(highlightedCrumpledImg(:, :, 1)) + 255 * double(edgesCrumpled)); % Highlight in red
end

figure;
imshow(highlightedCrumpledImg);
title('Highlighted Crumple Lines');

% Task 2: Remove Dots and Connect Borders
% Load the binary image
binaryImgPath = 'blackdot.jpg'; % Replace with your actual binary image path
binaryImg = imread(binaryImgPath);
% Ensure the binary image is 2D before display
if ndims(binaryImg) > 2
    binaryImg = binaryImg(:, :, 1); % Extract the first channel
end

% Ensure logical images are properly formatted
binaryImg = squeeze(binaryImg); % Remove singleton dimensions


% Convert to binary if not already binary
if ~islogical(binaryImg)
    binaryImg = imbinarize(binaryImg); % Threshold the image
end

% Enhance the image to remove dots and connect edges
% Step 1: Morphological dilation to connect nearby dots
se = strel('disk', 2); % Structural element (disk of radius 2)
dilatedImg = imdilate(binaryImg, se);

% Step 2: Skeletonize the image to create thin lines
skeletonImg = bwskel(dilatedImg);

% Step 3: Remove small noise (dots) using area-based filtering
cleanedImg = bwareaopen(skeletonImg, 50); % Remove regions smaller than 50 pixels

% Display the results
figure;
subplot(1, 3, 1);
imshow(binaryImg);
title('Original Binary Image');

subplot(1, 3, 2);
imshow(dilatedImg);
title('Dilated Image');

subplot(1, 3, 3);
imshow(cleanedImg);
title('Cleaned and Skeletonized Image');

% Save the final processed image
processedImagePath = 'processed_image.png'; % Define your output path
imwrite(cleanedImg, processedImagePath);
disp(['Processed image saved to: ', processedImagePath]);

% Load and preprocess the image
imagePath = 'crumpled_paper.jpg'; % Replace with your image path
img = imread(imagePath);

% Convert to grayscale if it's a color image
if size(img, 3) == 3
    grayImg = rgb2gray(img);
else
    grayImg = img;
end

% Enhance contrast to better visualize hills and valleys
enhancedImg = imadjust(grayImg);

% Edge detection to find transitions (hills and valleys)
edges = edge(enhancedImg, 'Canny', [0.1 0.3]); % Adjust thresholds as needed

% Compute gradient magnitude and direction for detailed analysis
[Gmag, Gdir] = imgradient(enhancedImg, 'sobel');

% Display the original image, edges, and gradient magnitude
figure;

subplot(2, 2, 1);
imshow(img);
title('Original Image');

subplot(2, 2, 2);
imshow(edges);
title('Detected Edges (Hills and Valleys)');

subplot(2, 2, 3);
imshow(Gmag, []);
colormap jet;
colorbar;
title('Gradient Magnitude (Hills and Valleys)');

subplot(2, 2, 4);
imshow(Gdir, []);
colormap jet;
colorbar;
title('Gradient Direction');

% Optional: 3D visualization of the surface (hills and valleys)
figure;
surf(double(grayImg), 'EdgeColor', 'none');
colormap gray;
view(3);
title('3D Surface Plot of Crumpled Paper');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Intensity');

% Save the processed results (edges and gradient magnitude)
imwrite(edges, 'detected_edges.png');
imwrite(mat2gray(Gmag), 'gradient_magnitude.png');
disp('Processed images saved: detected_edges.png, gradient_magnitude.png');


