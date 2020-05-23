% 
% Author: Bo Li    <morvanli@mail.xhu.edu.cn or morvanli@foxmail.com>    
%     
%%
clc;
close all;
clear all;
%%
addpath(genpath(cd));
%%
for j=1:20
    index = j;
    path1 = ['IVIF/IR/IR',num2str(index), '.png';];
    path2 = ['IVIF/VIS/VIS',num2str(index), '.png';];
    path_temp = './fused/';
    if exist(path_temp,'dir')==0
        mkdir(path_temp);
    end
    fuse_path = [path_temp, num2str(index), '.png'];
    if exist(fuse_path,'file')~=0
        continue;
    end
    A = imread(path1);
    A=double(A)/255;
    B = imread(path2);
    B=double(B)/255;
    F = Fuse_NSCT_CNPS(A, B);
    str=['image ', num2str(index), ' fusion completed!'];
    disp(str)
    imwrite(F,fuse_path,'png')
end
disp('All completed......')
%% End of Code