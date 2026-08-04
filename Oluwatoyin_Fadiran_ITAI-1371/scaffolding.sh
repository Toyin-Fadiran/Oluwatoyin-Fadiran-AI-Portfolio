#!/usr/bin/env bash

# List of remaining lab folders
for lab in \
  "L03_ML_Workflow_Types_of_Learning" \
  "Lab_04_Explaratory_Data_analysis" \
  "Lab_05_Data_Preparation_Feature_Engineering" \
  "Lab_06_Regression_and_Classification" \
  "Lab_07_Evaluating_Machine_Learning_Models" \
  "Lab_08_Overfitting_Underfitting_Regularization" \
  "Lab_09_Ensemble_Methods" \
  "Lab_10_Unsupervised_Learning" \
  "Lab_11_Hyperparameter_Tuning_AutoML" \
  "Lab_12_Ethics_Fairness_Bias" \
  "Lab_13_ML_Pipelines"
do
  # 1. Copy the structure and existing README from Lab 2 into the new folder
  cp -r Labs/L02_Tools_of_the_trade "Labs/$lab"
  
  # 2. Extract the lab number (e.g., "03", "04", "10") from the folder name
  lab_num=$(echo "$lab" | grep -o -E '[0-9]+' | head -1)
  padded_num=$(printf "%02d" "$lab_num")
  
  # 3. Rename the copied L02 notebook to match the new lab number (L03, L04, etc.)
  mv "Labs/$lab/L02_OluwatoyinFadiran_ITAI1371.ipynb" "Labs/$lab/L${padded_num}_OluwatoyinFadiran_ITAI1371.ipynb"
  
  # 4. Ensure a README.md exists at each sublevel (in case it was missing from the copy source)
  touch "Labs/$lab/README.md"
done
