# Notes
* OCR Architecture
1. image passed as input to the system
2. then we apply some pre-processing steps on the image
   1. de-skew which is the process of removing the skew from the image
   2. convert it to gray scale
   3. apply some filters
   4. apply smoothing.
3. detect lines, words and characters
4. produce ranked list of candidate characters