# ITAI 1371 Midterm Project: Titanic Survival Prediction

## Problem Statement
Can machine learning accurately predict passenger survival on the Titanic disaster based on demographic and travel information? This project demonstrates end-to-end ML investigation from data exploration to model evaluation, focusing on uncovering patterns that determined survival outcomes.

## Approach
### Data Exploration & Storytelling
- Analyzed 891 passenger records with features including age, gender, class, family size, and fare
- Created visualizations revealing key survival patterns:
  - **Gender impact**: Female passengers had significantly higher survival rates across all age ranges
  - **Family dynamics**: Passengers in smaller family groups (1-4 members) showed better survival outcomes than larger groups
  - Engineered new feature `FamilySize` = SibSp + Parch + 1 to capture group dynamics

### Data Preprocessing
- **Missing Values**: Filled 177 missing Age values with median (robust to outliers, preserves ~20% of dataset)
- **Categorical Encoding**:
  - Binary mapping: `Sex` → {female: 0, male: 1}
  - One-hot encoding: `Embarked` with `drop_first=True` to prevent multicollinearity
- **Feature Selection**: Retained 8 numeric features after encoding and dropped PassengerId

### Modeling Strategy
Trained and compared two classification models:

1. **Logistic Regression (Baseline)**
   - Max iterations: 1000
   - Default regularization
   - Simple, interpretable linear model

2. **HistGradientBoostingClassifier (Custom)**
   - Gradient boosting with histogram-based optimization
   - Handles non-linear relationships and feature interactions
   - More sophisticated ensemble method

## Results
### Model Performance Comparison

| Model | Accuracy | Precision (Survived) | Recall (Survived) | Training Time |
|-------|----------|---------------------|-------------------|---------------|
| Logistic Regression | 81.01% | 0.78 | 0.75 | Fast (~1s) |
| HistGradientBoosting | **82.12%** | 0.79 | 0.77 | Moderate (~3s) |

### Classification Metrics (HistGradientBoosting)
```
              precision    recall  f1-score   support

           0       0.84      0.85      0.84       105
           1       0.79      0.77      0.78        74

    accuracy                           0.82       179
```

### Confusion Matrix Analysis
- **True Positives**: 57 (correctly identified survivors)
- **True Negatives**: 90 (correctly identified non-survivors)
- **False Positives**: 15 (predicted survival incorrectly)
- **False Negatives**: 17 (missed actual survivors)

### Key Performance Insights
- **Marginal improvement**: HistGradientBoosting outperformed baseline by only 1.1%
- **Strong baseline**: Logistic Regression captured most predictive signals with simpler model
- **Precision-Recall tradeoff**: 79% precision vs. 77% recall indicates balanced but slightly conservative predictions

## Key Findings
### Survival Predictors
1. **Gender (strongest predictor)**: Female passengers had 3-4x higher survival rates than males
2. **Passenger class**: First-class passengers significantly more likely to survive than third-class
3. **Age**: Children prioritized in evacuations (historical "women and children first" policy)
4. **Family size**: Optimal group size of 2-4 members; solo travelers and large families fared worse

### Model Insights
- **Dataset characteristics**: Strong predictive signals allow even simple models to perform well
- **Diminishing returns**: Complex models provide minimal accuracy gains (~1%) on this dataset
- **Error analysis**: False Negatives (missing survivors) are more costly than False Positives in rescue scenarios
- **Feature engineering matters**: Created FamilySize feature revealed non-obvious survival patterns

### Limitations
- Small dataset (891 passengers) limits model generalization
- Missing values (Age, Cabin, Embarked) required imputation
- Historical context (1912) may not translate to modern scenarios
- Single train-test split (80/20) without cross-validation risks overfitting to split

## Technologies Used
- **Python 3.8+**
- **pandas** - Data manipulation and analysis
- **NumPy** - Numerical computing
- **scikit-learn** - Machine learning models and metrics
- **Matplotlib & Seaborn** - Data visualization
- **Jupyter Notebook** - Interactive development environment

## How to Run
### Prerequisites
```bash
pip install pandas numpy scikit-learn matplotlib seaborn jupyter
```

### Execution Steps
1. Open the notebook in Jupyter:
   ```bash
   jupyter notebook MT_OluwatoyinFadiran_ITAI1371.ipynb
   ```
2. Select **Kernel → Restart & Run All** to execute all cells sequentially
3. Expected runtime: ~5-10 minutes
4. All visualizations and metrics will display inline

### Dataset Source
- Titanic dataset loaded from: `https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv`
- Automatically downloaded when notebook runs

## Course Context
**ITAI 1371 - Introduction to Machine Learning | Midterm Project**  
Houston City College, AI and Robotics Program

**Learning Objectives Demonstrated:**
- ✅ End-to-end ML pipeline (EDA → Preprocessing → Modeling → Evaluation)
- ✅ Data storytelling and visualization
- ✅ Feature engineering and encoding strategies
- ✅ Model comparison and evaluation metrics
- ✅ Precision/recall tradeoff analysis
- ✅ Business context interpretation

## Future Improvements
If given more time, the following enhancements would strengthen the analysis:

1. **Cross-validation**: K-fold CV to reduce dependence on single train-test split and provide more reliable performance estimates
2. **Hyperparameter tuning**: GridSearchCV or RandomizedSearchCV to optimize model parameters
3. **Advanced feature engineering**:
   - Combine Pclass + Fare to capture socioeconomic status
   - Extract titles from Name field (Mr., Mrs., Master, etc.)
   - Cabin deck analysis (if missing values addressed)
4. **Ensemble methods**: Stack multiple models for improved predictions
5. **Handle class imbalance**: Apply SMOTE or class weighting (if dataset becomes imbalanced)
6. **Feature importance analysis**: Identify which features contribute most to predictions

## Project Grade
**Score**: 95/100  
**Strengths**: Thorough EDA, clear interpretations, well-justified preprocessing choices, insightful error analysis  
**Areas for improvement**: Could explore additional feature interactions and apply cross-validation

---

*Author: Oluwatoyin Fadiran*  
*Date: Completed as midterm project for ITAI 1371*  
*Last Updated: August 2026*
