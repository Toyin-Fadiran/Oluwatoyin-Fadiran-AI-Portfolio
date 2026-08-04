# Lab 06: Regression and Classification Models

## Overview
Understand the fundamental distinction between regression and classification problems. Build and evaluate linear models for both tasks using the Titanic dataset.

## Learning Objectives
- Distinguish between regression (continuous) and classification (categorical) problems
- Build Linear Regression models for predicting continuous values
- Build Logistic Regression models for classification tasks
- Evaluate models using appropriate metrics
- Interpret model coefficients

## What's Covered

### Part 1: Regression vs Classification
**Regression:**
- Predict continuous numerical values
- Examples: house prices, temperature, stock prices
- Evaluation: Mean Squared Error (MSE), RMSE, R²

**Classification:**
- Predict discrete categories or class labels
- Examples: spam/not spam, disease diagnosis, survival
- Evaluation: Accuracy, precision, recall, F1-score

### Part 2: Linear Regression
**Problem**: Predict Fare based on Age and Pclass

**Model**: LinearRegression
- Finds best-fitting line through data points
- Learns slope (coefficient) for each feature
- Learns intercept term

**Evaluation**: Mean Squared Error
- Average of squared differences between predicted and actual
- RMSE provides interpretable error in original units

### Part 3: Logistic Regression
**Problem**: Predict Survival based on Age, Pclass, and Sex

**Model**: LogisticRegression
- Despite name, used for classification
- Calculates probability of belonging to a class
- One of most interpretable classification models

**Evaluation**: Accuracy Score
- Percentage of correct predictions
- Suitable for balanced datasets

## Dataset
**Titanic Dataset:**
- Regression target: Fare (continuous)
- Classification target: Survived (binary: 0/1)
- Features: Age, Pclass, Sex

## Key Concepts

**When to Use Which:**
- Regression: "How much?" or "What value?"
- Classification: "Which category?" or "Yes or no?"

**Model Coefficients:**
- Positive coefficient: feature increases prediction
- Negative coefficient: feature decreases prediction
- Magnitude: strength of relationship

## Quick Start

```python
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.metrics import mean_squared_error, accuracy_score
```

## Assessment Tasks
1. Train Linear Regression to predict Fare
2. Evaluate using MSE and interpret RMSE
3. Train Logistic Regression to predict Survival
4. Calculate and interpret accuracy score
5. Examine model coefficients

## Key Takeaways
- Linear Regression for continuous targets
- Logistic Regression for categorical targets
- Different metrics for different problem types
- Preprocessing affects model performance

## Next Steps
- Learn advanced evaluation metrics (Lab 07)
- Understand confusion matrix, precision, recall
- Explore cross-validation techniques

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
