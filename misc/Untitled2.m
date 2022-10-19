clear all;
clc;
D = 'C:\Users\Mostafa\Pictures\Camera Roll\G50B20W30';
S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.
rect=[420 100 800 800];

for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    I = imread(F);
    Icrop=imcrop(I, rect);
    Igray=rgb2gray(Icrop);
  glcm0=graycomatrix(Igray, 'Numlevels', 256,'offset', [0 1], 'GrayLimits',[]);
  statsglcm0 = GLCM_Features4(glcm0(1:256, 1:256),0);
  writetable(struct2table(statsglcm0), 'Raisin0.xls', 'sheet', k, 'Range','A1:V2');
  
  glcm45=graycomatrix(Igray, 'Numlevels', 256,'offset', [-1 1], 'GrayLimits',[]);
  statsglcm45 = GLCM_Features4(glcm45(1:256, 1:256),0);
  writetable(struct2table(statsglcm45), 'Raisin45.xls', 'sheet', k, 'Range','A1:V2');
  
  glcm90=graycomatrix(Igray, 'Numlevels', 256,'offset', [-1 0], 'GrayLimits',[]);
  statsglcm90 = GLCM_Features4(glcm90(1:256, 1:256),0);
  writetable(struct2table(statsglcm90), 'Raisin90.xls', 'sheet', k, 'Range','A1:V2');
  
  glcm135=graycomatrix(Igray, 'Numlevels', 256,'offset', [-1 -1], 'GrayLimits',[]);
  statsglcm135 = GLCM_Features4(glcm135(1:256, 1:256),0);
  writetable(struct2table(statsglcm135), 'Raisin135.xls', 'sheet', k, 'Range','A1:V2');
end
