# Lab 04: Exploratory Data Analysis (EDA)

## Overview
Learn how to explore datasets to find patterns, anomalies, and insights before modeling. Use summary statistics and visualizations to understand data characteristics with the Titanic dataset.

## Learning Objectives
- Understand what EDA is and why it's critical before modeling
- Use descriptive statistics to summarize datasets
- Create and interpret visualizations to reveal patterns
- Identify missing values and data quality issues
- Discover relationships between variables

## What's Covered

### Part 1: Data Loading & Initial Inspection
- Loading the Titanic dataset (891 passengers)
- Using `.info()` and `.head()` for quick overview
- Identifying missing values and data types

### Part 2: Descriptive Statistics
- Using `.describe()` for numerical summaries
- Calculating survival rates, average age, fare ranges
- Understanding mean, std, min, max, quartiles

### Part 3: Visual EDA
**Visualizations Created:**
- Count plots for survival distribution
- Bar charts for categorical variables (Sex, Class, Embarked)
- Histograms for age distribution
- Correlation heatmaps for feature relationships
- Box plots to identify outliers

**Key Tools:**
- **Matplotlib**: Foundational plotting library
- **Seaborn**: High-level interface for statistical plots

### Part 4: Pattern Discovery
- Survival rates by gender, passenger class, and port
- Age distribution patterns
- Fare vs survival relationships
- Family size effects on survival

## Dataset
**Titanic**: 891 passengers with features including:
- Survived, Pclass, Sex, Age, SibSp, Parch, Fare, Embarked, Cabin
- Missing values in Age (~20%), Cabin (~77%), Embarked (~0.2%)

## Quick Start

```bash
# Load dataset from GitHub
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
df = pd.read_csv(url)
```

## Key Insights
- **Gender**: Women had higher survival rates
- **Class**: First-class passengers more likely to survive
- **Age**: Children had better survival chances
- **Missing Data**: Cabin heavily incomplete, Age partially missing

## Assessment
- Run all visualization cells
- Interpret patterns in the data
- Complete experimentation section
- Document observations

## Next Steps
- Use EDA insights for feature engineering (Lab 05)
- Identify which features to keep/transform
- Understand data before building models

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
