# Lab 07: Evaluating Machine Learning Models

## Overview
Move beyond simple accuracy to learn sophisticated evaluation techniques including confusion matrices, precision, recall, F1-score, and cross-validation for reliable model assessment.

## Learning Objectives
- Generate and interpret confusion matrices
- Calculate precision, recall, and F1-score
- Understand Type I and Type II errors
- Apply cross-validation for robust evaluation
- Choose appropriate metrics for different problems

## What's Covered

### Part 1: The Confusion Matrix
**Four Quadrants:**
- **True Positives (TP)**: Correctly predicted positive
- **True Negatives (TN)**: Correctly predicted negative
- **False Positives (FP)**: Type I Error (predicted positive, actually negative)
- **False Negatives (FN)**: Type II Error (predicted negative, actually positive)

**Visualization:**
- Heatmap with Seaborn
- Understand where model makes mistakes
- Identify class-specific performance

### Part 2: Precision, Recall, F1-Score
**Precision**: `TP / (TP + FP)`
- Of all positive predictions, how many were correct?
- Important when False Positives are costly
- Example: Spam filter (don't want to mark important emails as spam)

**Recall (Sensitivity)**: `TP / (TP + FN)`
- Of all actual positives, how many did we catch?
- Important when False Negatives are costly
- Example: Disease detection (don't want to miss actual cases)

**F1-Score**: Harmonic mean of Precision and Recall
- Single metric balancing both
- Useful for imbalanced datasets

### Part 3: Classification Report
- Provides precision, recall, F1 for each class
- Shows support (number of samples per class)
- Macro and weighted averages
- Using `classification_report` from sklearn

### Part 4: Cross-Validation
**Concept**: Train/test on multiple data splits
- More reliable than single train/test split
- Reduces variance in performance estimates
- K-Fold CV: Split data into k parts, train k times

**Implementation:**
- `cross_val_score` function
- Typical k values: 5 or 10
- Get mean and standard deviation of scores

## Dataset
**Titanic**: Predict survival using Age, Pclass, Sex, Fare
- Binary classification problem
- Slightly imbalanced classes

## Key Concepts

**When to Use Which Metric:**
- **Accuracy**: Balanced datasets, equal cost of errors
- **Precision**: When False Positives are expensive
- **Recall**: When False Negatives are expensive
- **F1-Score**: When you need balance or have imbalanced data

**Why Accuracy Isn't Enough:**
- 95% accuracy on 95% negative dataset is useless
- Doesn't show where mistakes happen
- Can be misleading for imbalanced data

## Quick Start

```python
from sklearn.metrics import confusion_matrix, classification_report
from sklearn.model_selection import cross_val_score
```

## Assessment Tasks
1. Generate and visualize confusion matrix
2. Calculate precision and recall manually
3. Generate classification report
4. Perform 5-fold cross-validation
5. Interpret results and choose best metric

## Key Takeaways
- Confusion matrix reveals error types
- Different metrics for different use cases
- Cross-validation provides robust estimates
- Always consider the cost of different errors

## Next Steps
- Understand overfitting/underfitting (Lab 08)
- Learn regularization techniques
- Explore learning curves

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
