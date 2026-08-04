# Lab 05: Data Preparation & Feature Engineering

## Overview
Learn and apply essential data preparation techniques to transform raw data into clean, model-ready formats. This preprocessing step is critical for building effective ML models.

## Learning Objectives
- Handle missing values using imputation strategies
- Encode categorical features into numerical formats
- Scale numerical features for model compatibility
- Prevent data leakage in preprocessing
- Create a complete data preparation workflow

## What's Covered

### Part 1: Handling Missing Values
**Imputation Strategies:**
- **Mean**: For normally distributed data
- **Median**: For skewed data or data with outliers (Age, Fare)
- **Mode**: For categorical data (Embarked)
- Using `.fillna()` method

**Tasks:**
- Impute Age column with median
- Handle missing Embarked values
- Decide whether to drop or impute Cabin (77% missing)

### Part 2: Encoding Categorical Features
**One-Hot Encoding:**
- Convert text categories to numerical format (0s and 1s)
- Transform Sex (male/female) → 2 binary columns
- Transform Embarked (C/Q/S) → 3 binary columns
- Using `pd.get_dummies()` function

### Part 3: Feature Scaling
**Standardization (StandardScaler):**
- Rescale features to mean=0, std=1
- Prevents large-scale features from dominating
- Apply to Age and Fare columns
- Essential for distance-based algorithms

### Part 4: Data Leakage Prevention
- Fit preprocessing only on training data
- Transform test data using training statistics
- Never mix train/test data during preprocessing

## Dataset
**Titanic Dataset:**
- 891 passengers
- Missing values: Age (~20%), Cabin (~77%), Embarked (~0.2%)
- Categorical: Sex, Embarked, Pclass
- Numerical: Age, Fare, SibSp, Parch

## Key Concepts

**Why Preprocessing Matters:**
- Most ML models require numerical input
- Different scales can bias model learning
- Missing values cause errors
- Poor preprocessing → poor model performance

**Common Mistakes to Avoid:**
- Fitting scaler on entire dataset before split (data leakage)
- Using mean for skewed data
- Dropping too many rows with missing values

## Quick Start

```bash
pip install pandas numpy scikit-learn
```

## Assessment Tasks
1. Impute Age with median
2. One-hot encode Sex and Embarked
3. Scale Age and Fare using StandardScaler
4. Verify no missing values remain

## Next Steps
- Apply preprocessing pipeline to build models (Lab 06)
- Understand which preprocessing for which algorithms
- Learn automated pipelines (Lab 13)

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
