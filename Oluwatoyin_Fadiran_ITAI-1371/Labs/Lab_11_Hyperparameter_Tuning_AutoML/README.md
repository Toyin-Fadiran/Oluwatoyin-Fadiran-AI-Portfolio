# Lab 11: Hyperparameter Tuning & AutoML

## Overview
Learn to optimize model performance by systematically tuning hyperparameters using Grid Search and Random Search. Introduction to Automated Machine Learning (AutoML) concepts.

## Learning Objectives
- Distinguish model parameters from hyperparameters
- Perform exhaustive Grid Search for optimal settings
- Use Random Search for efficient exploration
- Apply cross-validation during tuning
- Understand AutoML fundamentals

## What's Covered

### Part 1: What Are Hyperparameters?
**Model Parameters:**
- Learned from data during training
- Example: coefficients in Linear Regression

**Hyperparameters:**
- Set before training begins
- Control model structure or learning process
- Examples: n_estimators, max_depth, learning_rate

**Impact on Performance:**
- Wrong hyperparameters → poor results
- Optimal settings can dramatically improve accuracy
- Must be tuned systematically

### Part 2: Grid Search
**How It Works:**
- Define grid of hyperparameter values
- Try every possible combination
- Train and evaluate each with cross-validation
- Select best performing combination

**Pros:**
- Guaranteed to find best in grid
- Systematic and thorough
- Easy to implement with GridSearchCV

**Cons:**
- Computationally expensive
- Exponential growth with parameters
- May take hours for large grids

**Example Grid:**
```python
{
    'n_estimators': [50, 100, 200],
    'max_depth': [5, 10, None]
}
# Tests 3 × 3 = 9 combinations
```

### Part 3: Random Search
**How It Works:**
- Define distributions for hyperparameters
- Randomly sample combinations
- Try fixed number of iterations
- Often finds good solutions faster

**Pros:**
- More efficient than Grid Search
- Explores wider range
- Better for many hyperparameters

**Cons:**
- Not guaranteed to find best
- Requires more iterations for reliability

**When to Use:**
- Large hyperparameter spaces
- Limited computational budget
- Initial exploration before fine-tuning

### Part 4: Cross-Validation During Tuning
**Why CV is Critical:**
- Prevents overfitting to validation set
- More reliable performance estimates
- Each configuration tested on multiple splits

**Implementation:**
- GridSearchCV and RandomizedSearchCV
- Specify cv=5 or cv=10
- Uses stratified k-fold for classification

### Part 5: AutoML Introduction
**Concept:**
- Automate entire ML pipeline
- Model selection, preprocessing, tuning
- Democratizes machine learning

**Popular Tools:**
- Auto-sklearn
- TPOT
- H2O AutoML
- Google AutoML

## Dataset
**Iris**: 150 samples, 3 classes
- Small enough for quick experimentation
- Good for demonstrating concepts

## Hyperparameters to Tune

**Random Forest:**
- `n_estimators`: Number of trees (50-500)
- `max_depth`: Tree depth (5, 10, None)
- `min_samples_split`: Min samples to split (2, 5, 10)
- `max_features`: Features per split ('sqrt', 'log2', None)

**Logistic Regression:**
- `C`: Regularization strength (0.01, 0.1, 1, 10)
- `penalty`: Type ('l1', 'l2')
- `solver`: Optimization algorithm

## Quick Start

```python
from sklearn.model_selection import GridSearchCV, RandomizedSearchCV

# Grid Search
param_grid = {'n_estimators': [50, 100, 200], 'max_depth': [5, 10, None]}
grid_search = GridSearchCV(RandomForestClassifier(), param_grid, cv=5)
grid_search.fit(X_train, y_train)

# Best parameters
print(grid_search.best_params_)
print(grid_search.best_score_)
```

## Assessment Tasks
1. Train baseline Random Forest with defaults
2. Define hyperparameter grid
3. Perform Grid Search with 5-fold CV
4. Compare tuned vs baseline performance
5. Try Random Search for comparison
6. Analyze best hyperparameters found

## Key Concepts

**Tuning Strategy:**
1. Start with default parameters
2. Coarse grid search (wide ranges)
3. Fine-tune around best values
4. Use Random Search for exploration
5. Validate on held-out test set

**Common Mistakes:**
- Tuning on test set (data leakage)
- Too fine grid (overfitting)
- Not using cross-validation
- Ignoring computational cost

## Key Takeaways
- Hyperparameters significantly impact performance
- Grid Search: exhaustive but expensive
- Random Search: efficient exploration
- Always use cross-validation during tuning
- AutoML automates the entire process
- Start simple, then optimize

## Next Steps
- Learn about ethics and bias in ML (Lab 12)
- Understand fairness considerations
- Explore responsible AI practices

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
