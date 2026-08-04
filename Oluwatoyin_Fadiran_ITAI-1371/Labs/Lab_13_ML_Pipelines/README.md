# Lab 13: Building ML Pipelines

## Overview
Learn to create robust, reproducible ML workflows using scikit-learn Pipelines. Encapsulate preprocessing, feature engineering, and model training into professional, production-ready code.

## Learning Objectives
- Understand the importance of ML pipelines
- Prevent data leakage in preprocessing
- Build end-to-end pipelines with sklearn
- Combine multiple preprocessing steps
- Create reusable, deployable ML workflows

## What's Covered

### Part 1: Why Use Pipelines?
**Problems with Manual Workflows:**
- Many separate objects and steps
- Easy to make mistakes
- Hard to reproduce
- Risk of data leakage
- Difficult to deploy

**Data Leakage Risk:**
- Calculating statistics on entire dataset before split
- Test data "leaks" into training process
- Overly optimistic performance estimates
- Fails in production

**Pipeline Benefits:**
1. **Encapsulation**: All steps in one object
2. **Prevent Leakage**: Fit only on training data
3. **Reproducibility**: Easy to save and reuse
4. **Cleaner Code**: Less boilerplate
5. **Production Ready**: Simple deployment

### Part 2: The "Manual" Way (Before Pipelines)
**Traditional Workflow:**
```python
# Multiple separate steps:
1. Fill missing values
2. Drop columns
3. Split train/test
4. Scale numerical features
5. Encode categorical features
6. Combine features
7. Train model
8. Make predictions
```

**Issues:**
- 10+ separate objects to manage
- Easy to forget a step
- Preprocessing test data differently
- Hard to maintain

### Part 3: Building sklearn Pipelines
**Basic Pipeline Structure:**
```python
from sklearn.pipeline import Pipeline

pipeline = Pipeline([
    ('imputer', SimpleImputer()),
    ('scaler', StandardScaler()),
    ('model', LogisticRegression())
])

# One fit, one predict
pipeline.fit(X_train, y_train)
predictions = pipeline.predict(X_test)
```

**How It Works:**
- Each step is a transformer or estimator
- `.fit()` runs sequentially on training data
- `.transform()` or `.predict()` applies learned parameters
- Last step is typically the model

### Part 4: ColumnTransformer
**Handling Mixed Data Types:**
- Different preprocessing for different columns
- Numerical: impute + scale
- Categorical: impute + encode
- ColumnTransformer applies different pipelines per column type

**Example:**
```python
from sklearn.compose import ColumnTransformer

preprocessor = ColumnTransformer([
    ('num', numeric_pipeline, numeric_features),
    ('cat', categorical_pipeline, categorical_features)
])
```

### Part 5: Complete Pipeline Example
**Full Workflow:**
1. Define feature groups (numerical, categorical)
2. Create preprocessing pipeline for each
3. Combine with ColumnTransformer
4. Add model as final step
5. Train on training data
6. Evaluate on test data

**Titanic Dataset Pipeline:**
- Numerical: Age, Fare, SibSp, Parch
  - Impute median → Scale
- Categorical: Pclass, Sex, Embarked
  - Impute mode → One-hot encode
- Model: Random Forest Classifier

### Part 6: Advanced Pipeline Features
**GridSearchCV with Pipelines:**
```python
param_grid = {
    'model__n_estimators': [50, 100, 200],
    'model__max_depth': [5, 10, None]
}
grid_search = GridSearchCV(pipeline, param_grid, cv=5)
```

**Saving Pipelines:**
```python
import joblib
joblib.dump(pipeline, 'model_pipeline.pkl')
loaded_pipeline = joblib.load('model_pipeline.pkl')
```

**Custom Transformers:**
- Create your own preprocessing steps
- Implement fit() and transform() methods
- Integrate into pipelines

## Dataset
**Titanic**: 891 passengers
- Mixed data types (numerical + categorical)
- Missing values in multiple columns
- Perfect for demonstrating pipelines

## Key Concepts

**Data Leakage Prevention:**
- Pipeline fits transformers on training data only
- Test data only transformed, never fitted
- Cross-validation handles splits automatically
- No information leaks from validation/test sets

**Pipeline vs Manual:**
| Aspect | Manual | Pipeline |
|--------|--------|----------|
| Steps | Separate | Encapsulated |
| Leakage Risk | High | Low |
| Code Length | Long | Concise |
| Reproducibility | Hard | Easy |
| Deployment | Complex | Simple |

**Best Practices:**
- Always use pipelines for production
- Name each step clearly
- Test pipeline on small data first
- Save fitted pipelines for deployment
- Document preprocessing choices

## Quick Start

```python
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.impute import SimpleImputer

# Define pipelines
numeric_pipeline = Pipeline([
    ('imputer', SimpleImputer(strategy='median')),
    ('scaler', StandardScaler())
])

categorical_pipeline = Pipeline([
    ('imputer', SimpleImputer(strategy='most_frequent')),
    ('encoder', OneHotEncoder(handle_unknown='ignore'))
])

# Combine with ColumnTransformer
preprocessor = ColumnTransformer([
    ('num', numeric_pipeline, numeric_features),
    ('cat', categorical_pipeline, categorical_features)
])

# Full pipeline
full_pipeline = Pipeline([
    ('preprocessor', preprocessor),
    ('model', RandomForestClassifier())
])

# Train and predict
full_pipeline.fit(X_train, y_train)
predictions = full_pipeline.predict(X_test)
```

## Assessment Tasks
1. Refactor manual preprocessing into pipeline
2. Create separate numeric and categorical pipelines
3. Combine using ColumnTransformer
4. Add model as final step
5. Compare results with manual approach
6. Save and load pipeline
7. Use pipeline with GridSearchCV

## Key Takeaways
- Pipelines prevent data leakage
- Encapsulate entire workflow in one object
- Essential for production deployment
- Cleaner, more maintainable code
- Works seamlessly with cross-validation
- Easy to save and reproduce
- Professional ML development standard

## Next Steps
- Deploy pipeline to production
- Create model cards for documentation
- Implement monitoring and logging
- Build REST API around pipeline
- Continue learning advanced ML topics

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371

**Congratulations on completing the ITAI-1371 ML labs!** 🎉
