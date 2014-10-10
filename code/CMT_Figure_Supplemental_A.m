
%%% CODE FOR RECREATING CMT PAPER FIGURES  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Script to recreate Supplemental Human Data in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%  SUPPLEMENTAL FIGURE A : GA CORONAL HUMAN IMAGE : 6 IMAGES

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);
 
mat_file{1} = 'Human_GA_256';
mat_file{2} = 'Human_GA_203';
mat_file{3} = 'Human_GA_162';
mat_file{4} = 'Human_GA_122';
mat_file{5} = 'Human_GA_81';
mat_file{6} = 'Human_GA_68';

n =  246;
x = 1:1140;
y = 90:426;

% account for cropping in python
y = y - 86;
n = n - 86;

im = zeros(size(x,2),size(y,2),6);

for i = 1 : 6
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );
    clearvars -except img i n data_path mat_file im x y
    im(:,:,i) = squeeze(img(x,y,n));
    clear img
end

im = flipdim(im,2);
A = abs([ im(:,:,1) im(:,:,2) im(:,:,3) im(:,:,4) im(:,:,5) im(:,:,6)]);

figure;
imagesc(A); axis image off; colormap gray

A = (A-min(A(:)));
A = A/max(A(:));

outfile = sprintf('%s/../figures/Supp_Figure_A.tif', data_path);
imwrite(A,outfile,'tif');

