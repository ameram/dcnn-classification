clear all;
clc;
f=imread('WIN_20190108_22_33_04_Pro.jpg');
imshow (f);

rect=[420 100 800 800];


wt=imcrop(f, rect);
figure, imshow (wt);
