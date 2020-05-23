function F = Fuse_NSCT_CNPS(A,B)
%% Parameters for NSCT
pfilt = '9-7';
dfilt = 'pkva';
nlevs = [0,1,1,1,1];
yA=nsctdec(A,nlevs,dfilt,pfilt);
yB=nsctdec(B,nlevs,dfilt,pfilt);
n = length(yA);
%% Initialized the coefficients of fused image
Fused=yA;
%% Lowpass subband
ALow1= yA{1};
BLow1 =yB{1};
ALow2= yA{2};
BLow2 =yB{2};
Fused{1}=Lowpass_fusion(ALow1,BLow1);
Fused{2}=Lowpass_fusion(ALow2,BLow2); 
%% Highpass subband
for l = 3:n         
   for d = 1:length(yA{l})
    Ahigh = yA{l}{d};
    Bhigh = yB{l}{d};
    decision_map=(abs(Ahigh)>=abs(Bhigh));
    Fused{l}{d}=decision_map.*Ahigh + (~decision_map).*Bhigh; 
   end
end
%% NSTC nsctrec
F=nsctrec(Fused, dfilt, pfilt);
end