# Chihuahua vs. Muffin CNN Classifier

## Problem Statement
How do Convolutional Neural Networks (CNNs) improve upon traditional fully-connected networks for image classification? This project implements a CNN to classify chihuahuas vs. muffins, comparing its performance to the basic neural network from Module 04.

## Approach
### CNN Architecture
- **Convolutional Layers**:
  - Conv1: 3 → 32 channels (3×3 kernel) + ReLU + MaxPool
  - Conv2: 32 → 64 channels (3×3 kernel) + ReLU + MaxPool
  - Conv3: 64 → 128 channels (3×3 kernel) + ReLU + MaxPool
- **Fully Connected Layers**:
  - FC1: Flattened features → 512 neurons + ReLU + Dropout(0.5)
  - FC2: 512 → 2 output classes

### Training Configuration
- Input size: 224×224 RGB images
- Optimizer: Adam (lr=3e-4, weight_decay=1e-4)
- Loss function: CrossEntropyLoss
- Data augmentation: Random horizontal flips, rotations (±10°)
- Epochs: 10
- Batch size: 32

## Results
### Model Performance
- **Training Accuracy**: ~95-98% after 10 epochs
- **Validation Accuracy**: ~90-95%
- **Significant improvement** over Module 04's fully-connected network (~80% validation)

### Performance Comparison
| Model | Validation Accuracy | Parameters | Training Time |
|-------|-------------------|------------|---------------|
| Fully-Connected NN (Module 04) | ~80% | ~1.6M | ~5 min |
| CNN (Module 05) | ~93% | ~2.8M | ~15 min |

### Key Metrics
- Consistent loss decrease across epochs
- Minimal overfitting due to dropout and data augmentation
- Good generalization to validation set

## Key Findings
- **Spatial awareness**: CNNs preserve spatial relationships through convolution operations
- **Feature hierarchy**: Early layers detect edges, later layers detect complex patterns
- **Parameter efficiency**: Shared weights in convolutional kernels reduce parameters vs. fully-connected
- **Data augmentation**: Random transformations significantly reduce overfitting
- **Dropout regularization**: Prevents over-reliance on specific neurons
- **Larger input size** (224×224 vs. 64×64) provides more detail for learning

## Technologies Used
- **Python 3.8+**
- **PyTorch** - CNN implementation and training
- **torchvision** - Data loading, transforms, and augmentation
- **torchsummary** - Model architecture visualization
- **NumPy** - Numerical operations
- **Matplotlib** - Results visualization
- **tqdm** - Training progress tracking

## How to Run
### Google Colab (Recommended)
1. Open notebook in Google Colab
2. Mount Google Drive and navigate to dataset directory
3. Ensure dataset is available:
   ```bash
   !git clone https://github.com/patitimoner/workshop-chihuahua-vs-muffin.git
   ```
4. Enable GPU runtime: Runtime → Change runtime type → GPU
5. Run all cells sequentially
6. Expected runtime: ~15-20 minutes with GPU

### Local Environment
1. Install dependencies:
   ```bash
   pip install torch torchvision torchsummary numpy matplotlib tqdm
   ```
2. Download dataset from GitHub
3. Run notebook with Jupyter
4. GPU strongly recommended for reasonable training time

## Course Context
**ITAI 1378 - Module 05 | Convolutional Neural Networks**  
Houston City College, AI and Robotics Program

## Reflection Questions Addressed
1. **CNN vs. Traditional NN**: CNNs achieve ~13% higher accuracy by preserving spatial structure
2. **Convolutional layers**: Learn hierarchical features (edges → textures → objects)
3. **Improvements**: Larger dataset, transfer learning, ensemble methods
4. **Real-world challenges**: Lighting variations, occlusions, background clutter
5. **Data augmentation**: Increases effective dataset size, improves generalization
6. **Ethics**: Bias in training data, privacy concerns with image collection

## Hyperparameter Tuning Experiments
Try modifying:
- Learning rate (3e-4 → 1e-3 or 1e-4)
- Optimizer (Adam → SGD with momentum)
- Network depth (add/remove convolutional layers)
- Image size (224×224 → 128×128 or 256×256)
- Augmentation intensity (rotation angle, flip probability)
- Dropout rate (0.5 → 0.3 or 0.7)

## Credits
Based on original workshop by [DeepSense.ai](https://deepsense.ai/keras-vs-pytorch-avp-transfer-learning/)  
Modified and extended for ITAI 1378 curriculum
