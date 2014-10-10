
%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This m file contains the script to recreate Figure 5B in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%%  FIGURE 5B : LA CORONAL HUMAN IMAGE 

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);
  
mat_file{1} = 'Human_LA_256p_256';
mat_file{2} = 'Human_LA_203p_203';
mat_file{3} = 'Human_LA_122p_122';
mat_file{4} = 'Human_LA_68p_68';

n =  246;
x = 1:1140;
y = 90:426;

% account for cropping in python
y = y - 86;
n = n - 86;

im = zeros(size(x,2),size(y,2),4);

for i = 1 : 4
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );
    clearvars -except img i n data_path mat_file im x y code_path
    im(:,:,i) = squeeze(img(x,y,n));
    clear img
    disp(sprintf('mat file %d loaded',i));
end

im = flipdim(im,2);
A = abs([ im(:,:,1) im(:,:,2) im(:,:,3) im(:,:,4)]);

figure;
imagesc(A); axis image off; colormap gray

A = (A-min(A(:)));
A = A/max(A(:));

outfile = sprintf('%s/../figures/Figure_5B.tif', data_path);
imwrite(A,outfile,'tif');

