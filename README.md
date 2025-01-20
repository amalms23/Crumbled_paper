# Crumbled_paper
just did some fun analysis of a scanned pic of a crumbled paper :)
# Crumpled Paper Analysis using MATLAB

This repository contains MATLAB code for analyzing images of crumpled paper. The code performs several image processing tasks, including:

*   **Edge Detection:** Detects the edges representing the crumples in the paper.
*   **Noise Reduction and Edge Refinement:** Removes small dots and connects broken edges to create cleaner lines.
*   **Gradient Analysis:** Computes the gradient magnitude and direction to visualize the "hills" and "valleys" of the crumpled surface.
*   **3D Visualization:** Creates a 3D surface plot of the paper's intensity, providing a visual representation of the crumples.

## Files

*   `crumpled_paper.jpg`: An example image of crumpled paper (you should replace this with your own image).
*   `README.md`: This file.
*   MATLAB script (name not specified in the provided code, let's assume it's `crumpled_paper_analysis.m`): Contains the MATLAB code for image processing.
*   `blackdot.jpg`: Intermediate output: black and white edge image.
*   `processed_image.png`: Final output: processed, cleaned and skeletonized edge image.
*   `detected_edges.png`: Output: detected edges image.
*   `gradient_magnitude.png`: Output: gradient magnitude image.

## Requirements

*   MATLAB with the Image Processing Toolbox.

## Usage

1.  **Prepare your image:** Replace `crumpled_paper.jpg` with the path to your own crumpled paper image.
2.  **Run the MATLAB script:** Open MATLAB, navigate to the directory containing the files, and run the script (e.g., by typing `crumpled_paper_analysis` in the command window and pressing Enter).

## Output

The script generates the following output images:

*   `blackdot.jpg`: The initial detected edges from the Canny edge detector.
*   `processed_image.png`: The cleaned and skeletonized version of the edges, with noise removed and edges connected.
*   `detected_edges.png`: The detected edges used for gradient analysis.
*   `gradient_magnitude.png`: A grayscale image representing the gradient magnitude, highlighting the steepness of the crumples.

The script also displays several figures within MATLAB:

*   Original image and detected edges side-by-side.
*   Highlighted edges on the original image.
*   Comparison of the original binary image, dilated image, and cleaned/skeletonized image.
*   Original image, detected edges, gradient magnitude, and gradient direction.
*   A 3D surface plot of the crumpled paper.

## Code Explanation (Key Parts)

*   **Edge Detection (Canny):** The `edge(enhancedCrumpledImg, 'Canny')` function is used to detect edges. The contrast is enhanced before edge detection using `imadjust` for better results.
*   **Morphological Operations:** Dilation (`imdilate`) is used to connect nearby edges, and skeletonization (`bwskel`) is used to thin the edges. `bwareaopen` removes small noise regions (dots).
*   **Gradient Calculation:** `imgradient` with the 'sobel' method calculates the gradient magnitude and direction.
*   **3D Visualization:** `surf` is used to create a 3D surface plot based on the grayscale image intensity.

## Improvements

*   **Parameter Tuning:** The parameters for edge detection, morphological operations (e.g., disk radius, area threshold), and gradient calculation can be adjusted to optimize the results for different images.
*   **More Advanced Noise Reduction:** More sophisticated noise reduction techniques could be explored.
*   **Quantitative Analysis:** The code could be extended to perform quantitative analysis of the crumples, such as measuring the number of creases, their length, or their curvature.

## Example Usage in MATLAB

```matlab
% Assuming the script is named crumpled_paper_analysis.m
crumpled_paper_analysis;
