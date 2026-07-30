# Image Processing Adventure Quest

## Problem Statement
How do we evaluate and compare different image processing techniques? This project focuses on implementing image preprocessing pipelines and measuring their effectiveness using quantitative metrics like Structural Similarity Index (SSIM).

## Approach
- Developed computer vision preprocessing scripts using OpenCV and Pillow
- Implemented point operations (brightness adjustment, contrast enhancement, thresholding)
- Applied neighborhood operations (blurring, sharpening with various kernels)
- Evaluated image quality using SSIM (Structural Similarity Index) metrics
- Compared multiple sharpening kernels to determine optimal preprocessing strategies

## Results
- Successfully implemented and compared 3+ different sharpening kernels
- Quantified image quality improvements using SSIM scores
- Identified optimal kernel configurations for specific image types
- Created visual comparisons demonstrating preprocessing effects

## Key Findings
- SSIM provides objective measurement of image quality preservation
- Different sharpening kernels excel at different image characteristics
- Preprocessing choices significantly impact downstream AI model performance
- Balance between enhancement and noise introduction is critical

## Technologies Used
- **Python 3.8+**
- **OpenCV** - Advanced image processing operations
- **Pillow (PIL)** - Image I/O and basic manipulations
- **NumPy** - Numerical computations
- **Matplotlib** - Visualization
- **scikit-image** - SSIM metric calculation

## How to Run
1. Open in **Google Colab** or Jupyter Notebook
2. Install dependencies:
   ```bash
   pip install opencv-python pillow numpy matplotlib scikit-image
   ```
3. Upload test images or use provided sample images
4. Run cells sequentially
5. Expected runtime: ~20-25 minutes

## Course Context
**ITAI 1378 - Module 02 | Image Fundamentals and Processing**  
Houston City College, AI and Robotics Program
