
%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This m file contains the script to recreate Figure 4A in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%%  FIGURE 4A : AXIAL HUMAN IMAGE : GA

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);

mat_file{1} = 'Human_GA_256';
mat_file{2} = 'Human_GA_203';
mat_file{3} = 'Human_GA_122';
mat_file{4} = 'Human_GA_68';

n =  378;
x = 156:356;
y = 175:340;

% account for cropping in python
x = x - 86;
y = y - 86;

im = zeros(size(x,2),size(y,2),4);

for i = 1 : 4
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );
    clearvars -except img i n data_path mat_file im x y    
    im(:,:,i) = squeeze(img(n,x,y));
    clear img
    disp(sprintf('mat file %d loaded',i));
end


im = flipdim(im,1);
A = flipdim(abs([ im(:,:,1)' im(:,:,2)' im(:,:,3)' im(:,:,4)' ]),1);

figure;
imagesc(A); axis image off; colormap gray

A = (A-min(A(:)));
A = A/max(A(:));

outfile = sprintf('%s/../figures/Figure_4A.tif', data_path);
imwrite(A,outfile,'tif');

