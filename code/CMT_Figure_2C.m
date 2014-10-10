
%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This m file contains the script to recreate Figure 2 in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%% FIGURE 2C :  STATIC AXIAL PHANTOM IMAGE

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);

n = zeros(4);

%%%% 256 Recons
mat_file{1} = 'Phantom_STATIC_RAD_256';
mat_file{2} = 'Phantom_STATIC_RAD_185';
mat_file{3} = 'Phantom_STATIC_RAD_148';
mat_file{4} = 'Phantom_STATIC_RAD_92';

n = 8;

x = 170:300;
y = 140:290;

% account for cropping
x = x - 86;
y = y - 86;

im = zeros(size(x,2),size(y,2),4);

for i = 1 : 4
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );    
    im(:,:,i) = Output(x,y,n);
    clear img
    disp(sprintf('mat file %d loaded',i));  
end

A = abs(im);
A = A-min(A(:));
A = A/max(A(:));
A = reshape(A, [size(A,1) size(A,2) 1 size(A,3)]);

figure; montage(A,'Size',[ 4 ,1]); colormap gray; axis image off
F = getframe;

outfile = sprintf('%s/../figures/Figure_2C.tif', data_path);
imwrite(F.cdata,outfile,'tif');


