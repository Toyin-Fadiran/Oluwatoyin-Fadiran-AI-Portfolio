# Lab 10: Unsupervised Learning

## Overview
Understand and apply unsupervised learning techniques to find patterns in unlabeled data using K-Means Clustering and Principal Component Analysis (PCA).

## Learning Objectives
- Distinguish supervised from unsupervised learning
- Apply K-Means clustering to group similar data points
- Use the Elbow Method to find optimal cluster count
- Perform dimensionality reduction with PCA
- Visualize high-dimensional data in 2D/3D

## What's Covered

### Part 1: Supervised vs Unsupervised
**Supervised Learning:**
- Has labeled data (features X + target y)
- Goal: Learn mapping from X to y
- Examples: Classification, regression

**Unsupervised Learning:**
- Only features X, no labels
- Goal: Discover hidden structures
- Examples: Clustering, dimensionality reduction

### Part 2: K-Means Clustering
**How It Works:**
1. Randomly place k centroids
2. Assign each point to nearest centroid
3. Move centroids to average of assigned points
4. Repeat until convergence

**Applications:**
- Customer segmentation
- Image compression
- Anomaly detection
- Document clustering

**Challenges:**
- Must choose k beforehand
- Sensitive to initialization
- Assumes spherical clusters

### Part 3: The Elbow Method
**Finding Optimal k:**
- Try different k values (1 to 10)
- Calculate inertia (sum of squared distances)
- Plot inertia vs k
- Look for "elbow" where decrease slows

**Inertia:**
- Measures cluster compactness
- Lower = tighter clusters
- But more clusters always lower inertia
- Elbow balances cluster count vs quality

### Part 4: Visualization
**Scatter Plots:**
- Color points by assigned cluster
- Plot cluster centroids
- Show decision boundaries
- Verify cluster quality visually

### Part 5: Principal Component Analysis (PCA)
**Dimensionality Reduction:**
- Reduce features while keeping information
- Transform to new coordinate system
- First components capture most variance
- Useful for visualization and preprocessing

**Applications:**
- Visualize high-dimensional data
- Reduce noise
- Speed up training
- Remove correlated features

**How It Works:**
- Find directions of maximum variance
- Project data onto these directions
- Keep top k components

## Dataset
**Synthetic Blobs:**
- 300 samples, 4 natural clusters
- 2D features for easy visualization
- Generated with `make_blobs`

**Real Datasets:**
- Can apply to Iris, digits, customer data
- PCA useful for 10+ dimensions

## Key Concepts

**When to Use Clustering:**
- No labeled data available
- Explore data structure
- Segment customers/users
- Compress information

**Choosing k:**
- Domain knowledge
- Elbow method
- Silhouette score
- Try multiple values

**PCA Use Cases:**
- Visualization (reduce to 2D/3D)
- Noise reduction
- Feature extraction
- Preprocessing for supervised learning

## Quick Start

```python
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA

# K-Means
kmeans = KMeans(n_clusters=4, random_state=42)
labels = kmeans.fit_predict(X)

# PCA
pca = PCA(n_components=2)
X_reduced = pca.fit_transform(X)
```

## Assessment Tasks
1. Generate synthetic clustered data
2. Apply Elbow Method to find optimal k
3. Perform K-Means clustering with k=4
4. Visualize clusters with different colors
5. Apply PCA to reduce dimensions
6. Interpret explained variance

## Key Takeaways
- Unsupervised learning finds patterns without labels
- K-Means groups similar data points
- Elbow Method helps choose cluster count
- PCA reduces dimensions preserving information
- Visualization crucial for interpretation

## Next Steps
- Learn hyperparameter tuning (Lab 11)
- Explore Grid Search and Random Search
- Understand AutoML concepts

---
**Author**: Oluwatoyin Fadiran | **Course**: ITAI-1371
