# Lab 09: Ensemble Methods

## Overview
Learn how ensemble methods combine multiple models to create predictions that are more accurate and robust than individual models. Explore the "wisdom of the crowd" applied to machine learning.

## Learning Objectives
- Understand the concept of ensemble learning
- Compare single Decision Trees to Random Forests
- Apply bagging and boosting techniques
- Use cross-validation for robust evaluation
- Understand why ensembles reduce overfitting

## What's Covered

### Part 1: The Wisdom of the Crowd
**Core Concept:**
- One expert might be wrong
- Average of many diverse experts is surprisingly accurate
- Ensemble = committee of models voting on predictions

**Two Main Techniques:**
- **Bagging (Bootstrap Aggregating)**: Train on random data subsets
- **Boosting**: Sequential training, focus on previous errors

### Part 2: Single Decision Tree
**Characteristics:**
- Creates if-then rules from data
- Prone to overfitting
- High variance (sensitive to data changes)
- Can memorize training data

**Implementation:**
- Use DecisionTreeClassifier
- Evaluate on Iris dataset
- Observe performance variability

### Part 3: Random Forest Ensemble
**How It Works:**
1. Build hundreds of decision trees
2. Each trained on random data subset
3. Each uses random feature subset
4. Final prediction: majority vote

**Advantages:**
- Reduces overfitting through averaging
- More stable predictions
- Less sensitive to noise
- Feature importance scores

**Hyperparameters:**
- `n_estimators`: Number of trees (typically 100-500)
- `max_depth`: Tree depth limit
- `max_features`: Features per split

### Part 4: Model Comparison
**Metrics:**
- Test set accuracy
- 5-fold cross-validation scores
- Mean and standard deviation of CV scores

**Expected Results:**
- Random Forest typically outperforms single tree
- More consistent performance across folds
- Better generalization to new data

### Part 5: Other Ensemble Methods
**Gradient Boosting:**
- Sequential tree building
- Each corrects previous errors
- Examples: XGBoost, LightGBM, CatBoost

**Voting Classifiers:**
- Combine different model types
- Hard voting (majority) or soft voting (probabilities)

## Dataset
**Iris**: 150 samples, 4 features, 3 classes
- Clean dataset for clear comparisons
- Multiclass classification problem

## Key Concepts

**Why Ensembles Work:**
- Reduce variance through averaging
- Different models make different errors
- Errors cancel out when combined
- Robust to outliers and noise

**When to Use Ensembles:**
- When single models overfit
- When you need robust predictions
- When interpretability isn't critical
- Production systems requiring reliability

**Trade-offs:**
- More accurate but less interpretable
- Slower training and prediction
- Higher computational cost
- Harder to debug

## Quick Start

```python
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score

rf = RandomForestClassifier(n_estimators=100, random_state=42)
rf.fit(X_train, y_train)
scores = cross_val_score(rf, X, y, cv=5)
```

## Assessment Tasks
1. Train single Decision Tree classifier
2. Evaluate using cross-validation
3. Train Random Forest with 100 trees
4. Compare accuracy scores
5. Interpret why ensemble performs better

## Key Takeaways
- Ensembles > individual models
- Random Forest reduces Decision Tree overfitting
- Cross-validation gives reliable estimates
- Trade accuracy for interpretability
- Bagging works through diversity

## Next Steps
- Learn unsupervised learning (Lab 10)
- Explore clustering and dimensionality reduction
- Understand when labels aren't available

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
