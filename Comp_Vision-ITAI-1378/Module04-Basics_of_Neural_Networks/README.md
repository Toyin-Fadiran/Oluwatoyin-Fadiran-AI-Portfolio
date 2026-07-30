# Chihuahua vs. Muffin Classifier - Basic Neural Network

## Problem Statement
Can a fully-connected neural network learn to distinguish between visually similar categories (chihuahuas and muffins)? This classic challenge demonstrates the fundamental concepts of deep learning: forward propagation, backpropagation, and gradient-based optimization.

## Approach
- Built a custom fully-connected neural network from scratch using PyTorch
- Architecture: Input (12,288 pixels) → 128 → 64 → 32 → 2 (output classes)
- Implemented ReLU activation functions for non-linearity
- Used CrossEntropyLoss for binary classification
- Optimized with Stochastic Gradient Descent (SGD, lr=0.1)
- Trained for multiple epochs with train/validation split (120 train, 30 validation images)
- Applied image preprocessing: resize to 64×64, normalization

## Results
### Model Performance
- **Training Accuracy**: ~85-90% after 3 epochs
- **Validation Accuracy**: ~70-85% (varies by run due to small dataset)
- Loss decreased consistently across epochs
- Model shows reasonable generalization despite limited data

### Training Dynamics
- Epoch 1: ~60% validation accuracy
- Epoch 2: ~75% validation accuracy  
- Epoch 3: ~80% validation accuracy
- Some overfitting observed (train acc > val acc)

## Key Findings
- Fully-connected networks can learn image patterns but lack spatial awareness
- Small dataset (150 total images) limits generalization
- Flattening images loses spatial structure (motivation for CNNs in Module 05)
- Learning rate significantly impacts convergence speed
- Forward pass computes predictions; backward pass updates weights via gradients
- Validation set essential for monitoring overfitting

## Technologies Used
- **Python 3.8+**
- **PyTorch** - Neural network framework
- **torchvision** - Dataset management and transforms
- **Matplotlib** - Visualization
- **PIL (Pillow)** - Image loading
- **tqdm** - Training progress bars

## How to Run
### Option 1: Google Colab (Recommended)
1. Upload notebook to Google Drive
2. Mount Drive and navigate to project directory
3. Clone dataset repository:
   ```bash
   !git clone https://github.com/patitimoner/workshop-chihuahua-vs-muffin.git
   ```
4. Run all cells sequentially
5. GPU runtime recommended but not required

### Option 2: Local Environment
1. Install dependencies:
   ```bash
   pip install torch torchvision matplotlib pillow tqdm
   ```
2. Download dataset from GitHub repository
3. Run notebook with Jupyter
4. Expected runtime: ~10-15 minutes (CPU), ~3-5 minutes (GPU)

## Course Context
**ITAI 1378 - Module 04 | Basics of Neural Networks**  
Houston City College, AI and Robotics Program

## Challenges & Extensions
**Challenge**: Reach 100% validation accuracy by tweaking:
- Number of epochs
- Learning rate (lr parameter)
- Optimizer type (try Adam instead of SGD)
- Network depth (add more layers)
- Image size (try 128×128 instead of 64×64)
- Data augmentation (random flips, rotations)

## Credits
Original concept and dataset: [DeepSense.ai](https://deepsense.ai/keras-vs-pytorch-avp-transfer-learning/)  
Modified for educational purposes by Jing Zhao, Dylan Wang, Jason Do, Jason Jiang, and Andrew Jong.
