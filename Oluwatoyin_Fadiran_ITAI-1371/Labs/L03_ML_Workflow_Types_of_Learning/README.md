# Lab 03: Machine Learning Workflow and Types of Learning

## Overview
Learn to distinguish between types of machine learning, understand the complete ML workflow, and build your first classification models using the Wine dataset.

## Learning Objectives
- Distinguish between supervised, unsupervised, and reinforcement learning
- Understand and apply the complete 6-step ML workflow
- Build and evaluate classification models (Logistic Regression, Decision Trees)
- Work with different data types (numerical, categorical, text, boolean)
- Interpret model performance using metrics and visualizations

## What's Covered

### 1. Types of Machine Learning
- **Supervised Learning**: Learning from labeled data (classification & regression)
- **Unsupervised Learning**: Finding patterns without labels (clustering & dimensionality reduction)
- **Reinforcement Learning**: Learning through trial and error with rewards/penalties

### 2. The 6-Step ML Workflow
1. Data Preparation: Clean and prepare the data
2. Feature Selection: Choose relevant input variables
3. Data Splitting: Separate training (80%) and testing (20%) data
4. Model Training: Teach algorithms using training data
5. Model Evaluation: Test performance on unseen data
6. Model Interpretation: Understand what the model learned

### 3. Practical Implementation
- **Dataset**: Wine classification (178 samples, 13 features, 3 classes)
- **Models**: Logistic Regression vs Decision Tree comparison
- **Evaluation**: Accuracy scores, confusion matrices, classification reports
- **Visualization**: EDA with correlation heatmaps and class distributions

### 4. Data Types in ML
- Numerical (continuous/discrete)
- Categorical (nominal/ordinal)
- Text and Boolean

## Quick Start

**Google Colab**:
- Upload `L03_OluwatoyinFadiran_ITAI1371.ipynb` to [colab.research.google.com](https://colab.research.google.com)

**Local Setup**:
```bash
pip install pandas numpy matplotlib seaborn scikit-learn
jupyter notebook
```

## Key Concepts

**Why Split Data?**
- Training set teaches the model
- Testing set evaluates on unseen data
- Prevents overfitting (memorizing vs learning)

**Model Comparison**:
- Compare multiple algorithms on the same data
- Use consistent metrics (accuracy, precision, recall)
- Best model depends on the problem and data

**Confusion Matrix**:
- Diagonal = correct predictions
- Off-diagonal = misclassifications
- Helps identify which classes are confused

## Assessment Tasks
1. Identify ML types for real-world scenarios
2. Experiment with different feature combinations
3. Build and evaluate custom models
4. Reflect on model performance and improvements

## Real-World Applications
- **Recommendation Systems**: Netflix, Amazon (Hybrid ML)
- **Fraud Detection**: Banks, credit cards (Supervised)
- **Medical Diagnosis**: Healthcare imaging (Supervised)

## Next Steps
- Upload completed notebook to GitHub
- Experiment with other sklearn datasets (digits, breast_cancer)
- Practice the 6-step workflow on new problems
- Prepare for Module 4: Exploratory Data Analysis

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
