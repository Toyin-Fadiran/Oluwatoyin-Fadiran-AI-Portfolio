# Lab 08: Overfitting, Underfitting & Bias-Variance Tradeoff

## Overview
Understand and visualize overfitting, underfitting, and the bias-variance tradeoff—central concepts for building models that generalize well to new data.

## Learning Objectives
- Understand underfitting (high bias) and overfitting (high variance)
- Visualize the bias-variance tradeoff
- Use polynomial regression to control model complexity
- Interpret learning curves to diagnose model issues
- Apply regularization techniques to prevent overfitting

## What's Covered

### Part 1: Core Concepts
**Underfitting (High Bias):**
- Model too simple to capture patterns
- Poor performance on training AND test data
- Makes strong, incorrect assumptions

**Overfitting (High Variance):**
- Model too complex, memorizes training data
- Excellent on training, poor on test data
- Learns noise instead of true patterns

**The Goal:**
- Find "Goldilocks" complexity—just right
- Balance bias and variance
- Good performance on both train and test

### Part 2: Polynomial Regression Experiments
**Synthetic Dataset:**
- Sine wave with noise
- Known underlying pattern

**Model Complexity:**
- **Degree 1**: Straight line (underfit)
- **Degree 4**: Good fit (balanced)
- **Degree 15**: Overly wiggly (overfit)

**Visualization:**
- Plot predictions vs actual data
- See how complexity affects fit
- Identify visual signs of over/underfitting

### Part 3: Learning Curves
**What They Show:**
- Training score vs validation score
- Performance as function of training data size

**Diagnosing Issues:**
- **High Bias**: Both scores low, plateau quickly
- **High Variance**: Large gap between train and validation
- **Good Fit**: Scores converge to high value

**Using `learning_curve`:**
- From sklearn.model_selection
- Plots multiple train/validation splits
- Shows mean and standard deviation

### Part 4: Regularization Techniques
**L1 (Lasso) and L2 (Ridge) Regularization:**
- Add penalty for complex models
- Force coefficients toward zero
- Prevent overfitting without reducing features

**Hyperparameter Tuning:**
- Control regularization strength
- Find optimal balance

## Key Concepts

**Signs of Overfitting:**
- Training accuracy >> Test accuracy
- Model performs worse on new data
- Too many features or high complexity

**Solutions to Overfitting:**
- Increase training data
- Reduce model complexity
- Apply regularization
- Use cross-validation
- Feature selection

**Signs of Underfitting:**
- Low training AND test accuracy
- Model too simple for problem
- Learning curves plateau early

**Solutions to Underfitting:**
- Increase model complexity
- Add more features
- Reduce regularization
- Train longer

## Quick Start

```python
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import learning_curve
```

## Assessment Tasks
1. Create synthetic sine wave data
2. Train polynomial models (degrees 1, 4, 15)
3. Visualize predictions for each complexity
4. Generate and interpret learning curves
5. Identify under/overfitting scenarios

## Key Takeaways
- Complexity control is crucial
- More complex ≠ better
- Learning curves diagnose issues
- Regularization prevents overfitting
- Always validate on unseen data

## Next Steps
- Learn ensemble methods to combat overfitting (Lab 09)
- Explore Random Forests and boosting
- Understand bagging and voting

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
