clear all;
close all;
clc;
addpath(genpath(cd));
A = imread ('./IVIF/IR/IR2.png');
B = imread ('./IVIF/VIS/VIS2.png');
F = imread('./fused/2.png');
disp("Start");
disp('---------------------------Analysis---------------------------');
disp("Qabf MI FMI FMI_w MS_SSIM EN STD AVG SF EI ")
evaluation_res = analysis_Reference(uint8(F),uint8(A),uint8(B))
disp('Done');