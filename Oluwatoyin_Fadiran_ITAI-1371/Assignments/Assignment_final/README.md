# ITAI 1371 Final Project: IMDb Movie Review Sentiment Analysis

## Problem Statement
Streaming platforms and studios receive thousands of unstructured movie reviews daily, making manual sentiment tracking impossible to scale. This project builds an automated sentiment classification system to help platforms measure film reception and improve recommendation algorithms by analyzing customer satisfaction at scale.

## Approach
### Business Context
- **Target Users**: Streaming product managers and content marketing teams
- **Goal**: Automate audience satisfaction tracking to support data-driven decision-making
- **Applications**: Collective scoring, recommendation engines, marketing campaign optimization

### Dataset
- **Source**: IMDb Dataset of 50K Movie Reviews (Kaggle)
- **Size**: 50,000 balanced records (25,000 positive / 25,000 negative)
- **Text Type**: User-submitted English movie reviews
- **Labels**: Binary sentiment (`positive` or `negative`)

### Exploratory Data Analysis
**Key Findings:**
- **Perfect class balance**: 50/50 split prevents accuracy inflation from imbalanced data
- **Text characteristics**:
  - Average length: 1,309 characters (median: 970)
  - Distribution: Heavily right-skewed with outliers up to 13,704 characters
  - No length difference between positive and negative reviews
- **Data quality**: Zero missing values, but reviews contain HTML tags (`<br />`), punctuation, and stopwords

### Text Preprocessing Pipeline
**Cleaning Steps:**
1. Lowercase conversion for standardization
2. HTML tag removal (`<br />`, `<p>`, etc.)
3. URL, mention, and hashtag removal
4. Punctuation and number stripping
5. Extra whitespace normalization

**Feature Extraction (TF-IDF):**
```python
TfidfVectorizer(
    max_features=5000,      # Limit to top 5000 features (memory constraint)
    min_df=2,               # Remove rare typos/misspellings
    max_df=0.8,             # Remove overly common terms
    ngram_range=(1, 2),     # Capture unigrams + bigrams (e.g., "not good")
    stop_words='english'    # Filter common words
)
```
- **Final feature count**: 5,000 TF-IDF features
- **Rationale**: Balance between capturing predictive signal and preventing high-dimensionality memory issues

### Model Training
Trained and compared two classification models on 80/20 train-test split:

1. **Logistic Regression**
   - Fast, interpretable linear model
   - Learns word importance scores
   - Parameters: `max_iter=1000`, `n_jobs=-1`

2. **Multinomial Naive Bayes**
   - Designed specifically for text classification
   - Probabilistic model based on word frequency
   - Parameter: `alpha=1.0` (Laplace smoothing)

## Results
### Model Performance Comparison

| Model | Accuracy | Precision | Recall | F1-Score | Training Time |
|-------|----------|-----------|--------|----------|---------------|
| **Logistic Regression** | **89.11%** | **89.14%** | **89.11%** | **89.11%** | ~2 seconds |
| Multinomial Naive Bayes | 85.73% | 85.96% | 85.73% | 85.72% | <1 second |

### Detailed Classification Report (Logistic Regression)
```
              precision    recall  f1-score   support

    negative       0.90      0.88      0.89      5000
    positive       0.88      0.90      0.89      5000

    accuracy                           0.89     10000
```

### Confusion Matrix Analysis

**Logistic Regression:**
- True Negatives: 4,400 (correct negative predictions)
- True Positives: 4,511 (correct positive predictions)
- False Positives: 600 (neutral/negative labeled as positive)
- False Negatives: 489 (positive labeled as negative)
- **Total Correct**: 8,911 out of 10,000 (89.11%)

**Naive Bayes:**
- Shows **optimistic bias** with more False Positives (~800) vs. False Negatives (~650)
- Misses ~16% of actual negative reviews (84% negative recall)

### Performance Insights
- **Winner**: Logistic Regression outperforms Naive Bayes by **3.4 percentage points**
- **Balanced performance**: Both models show similar precision and recall across classes
- **Speed vs. Accuracy tradeoff**: Naive Bayes trains 2x faster but sacrifices accuracy
- **Error patterns**: Both models show slight positive bias (optimistic predictions)

## Key Findings
### Technical Insights
1. **TF-IDF effectiveness**: Converting text to 5,000 word-importance scores successfully captured sentiment signals
2. **Balanced dataset advantage**: 50/50 split allowed accuracy to be a reliable metric
3. **Bigram value**: Capturing two-word phrases preserved negations ("not good", "waste time")
4. **Classical ML viability**: Well-tuned traditional models achieve strong performance without deep learning

### Model Strengths & Weaknesses

**Logistic Regression:**
- ✅ Strengths: Higher accuracy (89%), balanced class performance, interpretable coefficients
- ⚠️ Weaknesses: Slower training, slightly misses 12% of negative reviews

**Naive Bayes:**
- ✅ Strengths: Extremely fast training (<1s), decent accuracy for speed
- ⚠️ Weaknesses: Lower accuracy (86%), optimistic bias, misses 16% of negatives

### Business Implications
1. **Aggregate insights over individual reviews**: With ~89% accuracy, rely on sentiment percentages across many reviews rather than single classifications
2. **Marketing applications**: Track audience reactions to adjust campaigns in near real-time
3. **Recommendation engines**: Use sentiment to improve content suggestions for subscribers
4. **Warning signs**: Monitor for vocabulary drift as reviewer language evolves over time

## Technologies Used
- **Python 3.8+**
- **pandas** - Data manipulation and loading
- **NumPy** - Numerical operations
- **scikit-learn** - TF-IDF vectorization, models, and metrics
- **Matplotlib & Seaborn** - Data visualization
- **Jupyter Notebook** - Interactive development
- **kagglehub** - Dataset downloading from Kaggle

## How to Run
### Installation
```bash
pip install pandas numpy scikit-learn matplotlib seaborn jupyter kagglehub
```

### Execution Steps
1. Open the notebook:
   ```bash
   jupyter notebook FP_MovieReviews_OluwatoyinFadiran.ipynb
   ```
2. The notebook will automatically download the IMDb dataset from Kaggle (requires Kaggle API credentials)
3. Run all cells sequentially: **Kernel → Restart & Run All**
4. Expected runtime: ~30-45 minutes (includes dataset download, preprocessing, and training)

### Alternative: Google Colab
1. Upload notebook to Google Drive
2. Open with Google Colab (no local setup required)
3. Run all cells with GPU runtime (optional, faster training)

### Dataset Access
The notebook uses `kagglehub` to automatically download:
- **Dataset**: `lakshmi25npathi/imdb-dataset-of-50k-movie-reviews`
- **File**: `IMDB Dataset.csv`
- First run requires Kaggle API authentication

## Course Context
**ITAI 1371 - Introduction to Machine Learning | Final Project**  
Houston City College, AI and Robotics Program

**Project Requirements Met:**
- ✅ Public sentiment dataset (IMDb reviews)
- ✅ Multiple classification models (Logistic Regression + Naive Bayes)
- ✅ Comprehensive evaluation metrics (accuracy, precision, recall, confusion matrix)
- ✅ Business context documentation
- ✅ Markdown explanations and interpretations

**Learning Objectives Demonstrated:**
- NLP text preprocessing and cleaning
- TF-IDF feature extraction
- Model comparison and selection
- Precision/recall tradeoff analysis
- Business insights and recommendations
- Limitation awareness and future improvements

## Lessons Learned
1. **Text preprocessing matters**: Removing HTML tags and stopwords significantly improved feature quality
2. **Memory constraints**: Limiting to 5,000 features prevented crashes on large text datasets
3. **Classical ML relevance**: A well-tuned Logistic Regression model trained in 2 seconds can solve real-world NLP tasks
4. **Metrics over accuracy**: Confusion matrices revealed error patterns that raw accuracy couldn't show
5. **Domain-specific limitations**: Movie review language may not generalize to other review types

## Future Improvements
If given more time and resources, consider:

1. **Expand dataset diversity**:
   - Include reviews from Rotten Tomatoes, Metacritic, Twitter
   - Train on multi-domain text for better generalization

2. **Advanced NLP techniques**:
   - Word embeddings (Word2Vec, GloVe) to capture semantic meaning
   - Pre-trained transformers (BERT, RoBERTa) for state-of-the-art performance
   - Attention mechanisms to identify key sentiment-bearing phrases

3. **Three-class classification**:
   - Add "neutral" sentiment category for nuanced analysis
   - Handle mixed or ambiguous reviews

4. **Model improvements**:
   - Ensemble methods (XGBoost, stacking)
   - Hyperparameter tuning with GridSearchCV
   - Cross-validation for robust performance estimates

5. **Production deployment**:
   - Build FastAPI service for real-time predictions
   - Create web interface for manual review labeling
   - Implement model monitoring for drift detection

6. **Error analysis deep dive**:
   - Manually inspect misclassified reviews to find patterns
   - Adjust preprocessing for sarcasm, negation, and mixed sentiment

## Project Assessment
**Key Accomplishments:**
- Achieved 89% accuracy on 50K reviews with classical ML
- Built complete end-to-end NLP pipeline
- Provided actionable business recommendations
- Demonstrated strong understanding of evaluation metrics

**Areas for Growth:**
- Could explore more advanced feature engineering
- Cross-validation would strengthen performance claims
- Deeper error analysis would reveal improvement opportunities

---

*Author: Oluwatoyin Fadiran*  
*Course: ITAI 1371 - Introduction to Machine Learning*  
*Last Updated: August 2026*
