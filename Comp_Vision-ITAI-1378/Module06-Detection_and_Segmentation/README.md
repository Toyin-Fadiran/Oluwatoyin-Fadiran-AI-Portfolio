# Object Detection and Image Segmentation Lab

## Problem Statement
How do we move beyond classification to localize and outline objects within images? This project explores modern object detection (YOLO11) and instance segmentation techniques, comparing specialist models with foundation models (SAM 2) for real-world computer vision applications.

## Approach
### Object Detection
- Implemented YOLO11 (You Only Look Once v11) nano model for real-time object detection
- Detected 80 COCO dataset categories (person, car, dog, etc.)
- Explored confidence threshold tuning for precision/recall trade-offs
- Analyzed Non-Maximum Suppression (NMS) for duplicate box removal

### Instance Segmentation
- Applied YOLO11-seg for pixel-level object masks
- Implemented SAM 2 (Segment Anything Model 2) foundation model
- Compared specialist vs. foundation model approaches
- Built detect-then-segment pipeline: YOLO11 detection → SAM 2 segmentation

### Evaluation Metrics
- **IoU (Intersection over Union)**: Measures bounding box overlap accuracy
- **Precision**: Percentage of correct detections among all predictions
- **Recall**: Percentage of actual objects successfully detected
- **mAP (mean Average Precision)**: Standard benchmark combining precision/recall

## Results
### Detection Performance (YOLO11n on sample images)
- Successfully detected multiple object classes per image
- Confidence scores: 0.85-0.95 for clear objects
- Real-time processing: ~30-50ms per image on GPU
- Accurate bounding boxes with IoU > 0.75 for most detections

### Segmentation Quality
- **YOLO11-seg**: Fast, category-aware masks for 80 COCO classes
- **SAM 2**: Higher-quality masks for any object via prompt-based segmentation
- Combined pipeline: Best of both worlds (labeled + high-quality masks)

### Confidence Threshold Analysis
- **Low threshold (0.10)**: More detections, increased false positives
- **Medium threshold (0.25)**: Balanced precision/recall (default)
- **High threshold (0.70)**: Fewer detections, high confidence only

## Key Findings
### Technical Insights
- **Classification vs. Detection vs. Segmentation**: Each task serves different use cases
- **Specialist models** (YOLO) excel at known categories with fast inference
- **Foundation models** (SAM 2) handle unknown objects but require prompts
- **NMS is critical** for removing duplicate detections
- **IoU thresholds** define detection quality standards (0.5-0.75 typical)

### Practical Trade-offs
| Aspect | YOLO11 | SAM 2 |
|--------|--------|-------|
| Speed | Very Fast (~30ms) | Slower (~200ms) |
| Categories | 80 fixed classes | Any object (prompt-based) |
| Output | Labels + Boxes/Masks | Masks only |
| Use Case | Known object types | Unknown/custom objects |

### Application-Specific Considerations
- **Safety systems**: Prioritize recall (low threshold) to avoid missing hazards
- **Photo tagging**: Prioritize precision (high threshold) to avoid wrong labels
- **Medical imaging**: Segmentation essential for precise measurements
- **Retail analytics**: Detection sufficient for counting/positioning

## Technologies Used
- **Python 3.8+**
- **Ultralytics** - YOLO11 and SAM 2 unified framework
- **PyTorch** - Deep learning backend
- **Matplotlib** - Visualization
- **PIL (Pillow)** - Image processing
- **NumPy** - Array operations

## How to Run
### Google Colab (Recommended)
1. Open `Lab_06_Oluwatoyin_Fadiran_ITAI1378.ipynb` in Colab
2. Install Ultralytics library:
   ```bash
   !pip install ultralytics
   ```
3. Run all cells sequentially
4. GPU runtime recommended (but not required for small images)
5. Expected runtime: ~20-30 minutes

### Try Your Own Images
```python
# Option 1: Use URL
my_image = "https://your-image-url.com/image.jpg"

# Option 2: Upload to Colab
from google.colab import files
uploaded = files.upload()
my_image = list(uploaded.keys())[0]

# Run detection
results = detector(my_image)
```

## Course Context
**ITAI 1378 - Module 06 | Object Detection and Segmentation**  
Houston City College, AI and Robotics Program

## Midterm Project Proposal
**License Plate Detection Application**
- **Objective**: Detect and localize vehicle license plates using YOLO11
- **Dataset**: Kaggle/Roboflow labeled license plate datasets
- **Approach**: Train YOLO11 on custom license plate dataset
- **Capstone Extension**: Add OCR (Tesseract) to read plate text, integrate with database lookup for parking/access control

## Reflection Questions Answered
1. **Tasks comparison**: Classification identifies, detection localizes, segmentation outlines
2. **NMS purpose**: Removes duplicate overlapping boxes, keeps highest confidence
3. **IoU meaning**: Measures prediction accuracy via box overlap percentage
4. **Detection success**: Dependent on object category presence in training data
5. **Box vs. mask**: Boxes sufficient for counting; masks needed for precise editing
6. **SAM 2 difference**: No category labels, prompt-driven segmentation of anything
7. **Threshold trade-off**: Low for safety (high recall), high for tagging (high precision)
8. **Precision vs. recall**: Safety needs recall, tagging needs precision
9. **Model choice**: Specialist (YOLO) for known objects, foundation (SAM 2) for unknown

## Future Extensions
- Train on custom dataset (Roboflow format)
- Implement real-time video detection
- Deploy to edge devices (Raspberry Pi, Jetson Nano)
- Build detection + tracking pipeline
- Integrate with database for automated workflows

## References
- Ultralytics YOLO11 Documentation: https://docs.ultralytics.com
- Meta SAM 2: https://ai.meta.com/sam2
- COCO Dataset: https://cocodataset.org

## Credits
**Author**: Patricia McManus  
**Collaborator**: Claude (Anthropic)  
**Course**: AI and Robotics Program, Houston City College, 2026
