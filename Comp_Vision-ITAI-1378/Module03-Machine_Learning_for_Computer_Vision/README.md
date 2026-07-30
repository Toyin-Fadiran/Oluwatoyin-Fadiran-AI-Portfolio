# CIFAR-10 Image Classification with Machine Learning

## Problem Statement
Can traditional machine learning models effectively classify images without deep learning? This project explores Support Vector Machines (SVM) for image classification on the CIFAR-10 dataset, comparing different kernel functions and feature extraction approaches.

## Approach
- Loaded and preprocessed CIFAR-10 dataset (subset of 3 classes: cat, dog, ship)
- Implemented feature extraction through image flattening
- Trained SVM classifiers with multiple kernel types:
  - Linear kernel for baseline performance
  - RBF (Radial Basis Function) kernel for non-linear decision boundaries
- Compared grayscale vs. RGB color feature representations
- Optimized hyperparameters (C, gamma) for improved performance

## Results
### Model Performance
- **Linear SVM (Grayscale)**: ~50-60% accuracy
- **RBF SVM (Grayscale)**: ~65-75% accuracy (C=10, gamma='scale')
- **RBF SVM (RGB)**: ~70-80% accuracy (improved with color information)

### Key Metrics
- Classification reports showing precision, recall, and F1-scores per class
- Confusion matrices revealing class-specific performance
- Demonstrated color features improve classification over grayscale

## Key Findings
- RBF kernel significantly outperforms linear kernel for complex image data
- Retaining color information (RGB) improves accuracy by ~5-10%
- Traditional ML requires careful feature engineering compared to deep learning
- SVMs can achieve reasonable performance but are computationally intensive for large datasets
- Preprocessing choices (normalization, feature scaling) critically impact results

## Technologies Used
- **Python 3.8+**
- **TensorFlow/Keras** - CIFAR-10 dataset loading
- **Scikit-Learn** - SVM models, train/test split, metrics
- **NumPy** - Array operations and numerical computing
- **Matplotlib** - Data visualization

## How to Run
1. Open in **Google Colab** (recommended for GPU) or Jupyter Notebook
2. Install required packages:
   ```bash
   pip install numpy matplotlib tensorflow scikit-learn
   ```
3. Run `L03_B_Oluwatoyin_Fadiran_ITAI_1378.ipynb` for main SVM experiments
4. Run `L03_Fadiran_Oluwatoyin_ITAI1378.ipynb` for extended feature extraction analysis
5. Expected runtime: ~30-45 minutes (varies with SVM training)

## Course Context
**ITAI 1378 - Module 03 | Machine Learning for Computer Vision**  
Houston City College, AI and Robotics Program

## Future Extensions
- Expand to all 10 CIFAR-10 classes
- Compare with other ML algorithms (Random Forest, k-NN)
- Implement feature extraction using HOG or SIFT descriptors
- Benchmark against deep learning CNNs (Module 05)
