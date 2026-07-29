#!/usr/bin/env bash

# List of formatted module directories to create based on your syllabus
MODULES=(
  "Module01-Computer_Vision_Fundamentals"
  "Module03-Machine_Learning_for_Computer_Vision"
  "Module04-Basics_of_Neural_Networks"
  "Module05-Convolutional_Neural_Networks"
  "Module06-Detection_and_Segmentation"
)

# Loop through each module name
for mod in "${MODULES[@]}"; do
  echo "Scaffolding: $mod..."

  # 1. Copy the structure from your existing Module 2
  cp -r Module2-Image_Fundamentals_and_Processing "$mod"
  
  # 2. Extract the number from the folder name (e.g., "03" from "Module03")
  mod_num=$(echo "$mod" | grep -o -E '[0-9]+' | head -1)
  padded_num=$(printf "%02d" "$mod_num")
  
  # 3. Rename the notebook to match the new module number (L01, L03, L04, etc.)
  mv "$mod/L02_Fadiran_Oluwatoyin_ITAI1378.ipynb" "$mod/L${padded_num}_Fadiran_Oluwatoyin_ITAI1378.ipynb"
done

echo "Done! All module folders and notebooks created successfully."
