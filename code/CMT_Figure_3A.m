
%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This m file contains the script to recreate Figure 3A in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%%  FIGURE 3A : CORONAL PHANTOM IMAGE

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);

mat_file{1} = 'Phantom_GA_256';
mat_file{2} = 'Phantom_GA_185';
mat_file{3} = 'Phantom_GA_148';
mat_file{4} = 'Phantom_GA_92';

mat_file{5} = 'Phantom_LA_256p_256';
mat_file{6} = 'Phantom_LA_185p_185';
mat_file{7} = 'Phantom_LA_148p_148';
mat_file{8} = 'Phantom_LA_92p_92';

%%% FIGURE 3A
x = 1 : 800;
y = 165:360;
n =  210;

% account for cropping in python
y = y - 86;
n = n - 86;

im = zeros(size(x,2),size(y,2),8);

for i = 1 : 8
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );
    clearvars -except img i n data_path mat_file im x y
    im(:,:,i) = squeeze(img(x,y,n));
    clear img
    disp(sprintf('mat file %d loaded',i));
end


A = abs([ im(:,:,5)' im(:,:,1)'; im(:,:,6)' im(:,:,2)'; im(:,:,7)' im(:,:,3)'; im(:,:,8)' im(:,:,4)']);

figure;
imagesc(A); axis image off; colormap gray

A = (A-min(A(:)));
A = A/max(A(:));

outfile = sprintf('%s/../figures/Figure_3A.tif', data_path);
imwrite(A,outfile,'tif');

