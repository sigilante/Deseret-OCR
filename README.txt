#   Deseret OCR

Illinois Deseret Consortium

This repo contains code and data necessary to train an OCR on the 1869 Book of Mormon published by Russell Bros. in New York City.

---

##  Procedure

### 1. Data Collection:

#### a. Image Dataset:

- Gather a diverse dataset of images containing examples of the Deseret alphabet.  (`chars-raw`)
- Ensure variations in font, size, style, and orientation to make the OCR robust.  (omitted)

#### b. Annotation:

- Manually annotate the images to mark the bounding boxes around individual characters.  (`charproc.m`, `chars-sorted`)
- Label each bounding box with the corresponding Deseret alphabet character.  (omitted)

### 2. Data Preprocessing:

#### a. Image Cleaning:

- Remove noise and artifacts from the images, ensuring clarity and consistency.
- Standardize the image size and resolution.  (`char-clean.py`, `chars-cleaned`)

#### b. Data Augmentation:

- Increase the size of your dataset by applying transformations like rotation, scaling, and flipping to create variations of the original images.  (omitted)

### 3. Training Data Preparation:

#### a. Split Dataset:

- Divide your dataset into training, validation, and test sets to evaluate the OCR model's performance.  (`split.py`)

#### b. Convert Annotations:

- Convert the annotated data into a format compatible with your OCR training framework (e.g., YOLO format, COCO format).

### 4. OCR Model Selection:

#### a. Choose a Framework:

- Select an OCR framework that supports training on custom datasets. Tesseract, PyTesseract, and TensorFlow OCR are popular choices.

#### b. Model Architecture:

- Choose or design a model architecture suitable for your OCR task. Consider architectures like CNNs (Convolutional Neural Networks) and RNNs (Recurrent Neural Networks).

### 5. Training:

#### a. Configure Training Parameters:

- Set hyperparameters such as learning rate, batch size, and number of epochs.

#### b. Train the Model:

- Feed the preprocessed data into the OCR model and train it on the Deseret alphabet dataset.

### 6. Evaluation:

#### a. Validation Set:

- Evaluate the OCR model's performance on the validation set to fine-tune parameters and prevent overfitting.

#### b. Test Set:

- Assess the final model on the test set to ensure generalization to unseen data.

### 7. Deployment:

#### a. Integration:

- Integrate the trained OCR model into your desired application or system.

#### b. Testing in Real-World Scenarios:

- Test the OCR system with real-world examples to identify and address any issues.

---

- https://nanonets.com/blog/ocr-with-tesseract/
- https://pretius.com/blog/ocr-tesseract-training-data/
- https://github.com/zdenop/qt-box-editor

---

================
SINGLE GLYPHS
================
Objective: To obtain one token of each type for preliminary work.
All images of glyphs are 0.736 in. high, with variable width
=======
All images of glyphs are 0.736 in high, with variable width
BoM pages downloaded from archive.org as .JP2
Opened in Adobe Photoshop and sliced, renamed, and saved as individual .PNG
BoM Scan Pages Used for initial character sampling
0003
0010
0066
0182

================
CORPUS OF GLYPHS
================
Objective: To obtain a random sampling of multiple tokens of the same type:
BoM scan pages used
0005

Each line of full text (excluding lines in all caps) were sliced in Adobe Photoshop.
Frames were 0.736 in. high with variable width
Frames were aligned with the bottom of the comma and the top of the cap.

TODO: Mitigate frequency effects (glyphs like zhee and chee are rare)

Characters are extracted from [the Web Archive publication of the 1869 Book of Mormon](https://archive.org/details/bookofmormdeseretalpha00/page/28/mode/2up) under fair use provisions.

charproc.m pads character .pngs to dimensions of the tallest and widest characters, nearly centering the original glyph in the frame.
Light noise is added to minimize the effect of the white borders on clustering analysis.
Clustering analysis using kmeans with groups = 48 to accommodate 38 glyphs and 10 punctuation marks.
Relabeled images are found inc ..\chars-L\ where the prefix p0-c is followed by the glyph-type (01-48) and the serial id / unique identifier for the glyph
Notes on classification: 
(1) Caps are generally clustered (e.g., glyph-type 35) due to glyph size rather than shape;
(2) Clustering is less robust for highly similar shapes like long-a vs aw, long-o vs long-ah;
(3) Numerals and punctuation are not frequent enough, relatively speaking, to form their own classes;
(4) ..
TODO: Further assess clustering and optimize as needed

Glyphs organized into subfolders in chars-L. This was done by visual inspection of each kmeans cluster and manual copy and paste. The kmeans clustering did most of the heavy lifting. 
Problematic distinctions included aw/long-a; long-a/long-e; kay/gay; gay/long-aw. It is possible that a handful of determinations would be different if the words were found in context (e.g., a-long vs e-long)
TODO: Should majuscule and miniscules be organized together?
