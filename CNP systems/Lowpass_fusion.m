function [cp, map] =Lowpass_fusion(matrixA,matrixB)

fire_matrixA = CNPS(abs(matrixA),110);
fire_matrixB = CNPS(abs(matrixB),110);
map=fire_matrixA >= fire_matrixB;
cp=map.*matrixA+~map.*matrixB;