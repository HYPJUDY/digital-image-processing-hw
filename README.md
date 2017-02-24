# digital-image-processing-hw
Homeworks(codes &amp; reports) from 2016 SYSU's Digital Image Processing course taught by Professor Hongyang Chao.
## Welcome
Welcome to my DIP homeworks! They are basic exercises for understanding DIP fundamental knowledge. Our text book is Digital Image Processing by Gonzalez and Woods.

Warning: homework solutions for reference but not Plagiarism.

If you find bugs, false logic, just anything that could be better, please do me a favor by creating issues. I would love to see constructively negative feedbacks.

And sorry that the implementation of Fast Fourier Transform in hw3 maybe wrong.

## Structure
There are four homeworks and a final project in total.
Each homework is composed of several questions and certain programming works.
And the final project is about haze removal.


### hw1-Scaling and Quantization
1. Exercises
  * Storage
  * Adjacency
  * Logical Operations
2. Programming Tasks
  * Scaling
  * Quantization

### hw2-Histogram and Spatial Filtering
1. Exercises
  * Linearity
  * Spatial Filtering
  * Logical Operations
2. Programming Tasks
  * Histogram Equalization
  * Spatial Filtering

### hw3-Filtering in the Frequency Domain
1. Exercises
  * Rotation
  * Fourier Spectrum
  * Lowpass and Highpass
2. Programming Tasks
  * Fourier Transform
  * Bonus: Fast Fourier Transform
  * Filtering in the Frequency Domain

### hw4-Image Restoration and Color Image Processing
1. Exercises
  * Color Spaces
  * Fourier Spectrum
  * Lowpass and Highpass
2. Programming Tasks
  * Image Filtering
  * Image Denoising
  * Histogram Equalization on Color Images

### Final Project: Haze Removal
1. Description & Background
  
   In ECCV 2010 (one of the top conferences in Computer Vision), 
   Kaiming He (currently a researcher in Facebook) designed a simple 
   but powerful approach to perform as an edge-preserving smoothing operator, 
   called Guided Image Filer. This operator is proposed as a smoothing operator,
   but moreover, it is effective and efficient in a great variety of computer vision
   and graphics applications, including details enhancement, HDR compression, 
   image matting/feathering, etc. This approach has been included in Matlab 2014
   and OpenCV 3.0 as a basic function. Considering its easy implementation, 
   we can reproduce it in the final project.
2. Tasks
  * Implement the approach described in "guided_image_filtering_eccv2010.pdf"(2013 version is better) paper.
  * Evaluate the implementation by conducting experiments.
  * Explore the disadvantages of the paper by experiments, and try to handle those issues.

3. Reference
  [Guided Image Filtering](http://kaiminghe.com/eccv10/index.html)