function  res = analysis_Reference1(image_f,image_ir,image_vis)
[s1,s2] = size(image_ir);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_ir;
imgSeq(:, :, 2) = image_vis;
image1 = im2double(image_ir);
image2 = im2double(image_vis);
image_fused = im2double(image_f);
Result=zeros(1,10);
Result(1,1) = analysis_Qabf(image1,image2,image_fused);
Result(1,2) = analysis_MI(image_ir,image_vis,image_f);
Result(1,3) = analysis_fmi(image1,image2,image_fused);
Result(1,4) = analysis_fmi(image1,image2,image_fused,'wavelet');
Result(1,5) = analysis_ms_ssim(imgSeq, image_f);
Result(1,6)= entropy(image_f);
Result(1,7)= std2(image_f);
Result(1,8)= avg_gradient(image_f);
Result(1,9)= spatial_frequency(image_f);
Result(1,10)= edge_intensity(image_f);
res = Result;
end







