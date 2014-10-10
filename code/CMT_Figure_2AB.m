
%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%
%%% This m file contains the script to recreate Figure 2 in the paper.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%% FIGURE 2A AND 2B :  AXIAL PHANTOM IMAGE
 
% Acquisition : 256  185  148  92   GA
% Recon
%       256
%       185
%       148
%        92

% clean slate
clear all; close all; clc;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);

n = zeros(20);

%%%% 256 Recons
mat_file{1} = 'Phantom_LA_256p_256';n(1) = 91;
mat_file{2} = 'Phantom_LA_185p_256';n(2) = 91;
mat_file{3} = 'Phantom_LA_148p_256';n(3) = 91;
mat_file{4} = 'Phantom_LA_92p_256';n(4) = 89;
mat_file{5} = 'Phantom_GA_256';n(5) = 91;

%%%% 185  Recons
mat_file{6} = 'Phantom_LA_256p_185';n(6) = 91;
mat_file{7} = 'Phantom_LA_185p_185';n(7) = 91;
mat_file{8} = 'Phantom_LA_148p_185';n(8) = 91;
mat_file{9} = 'Phantom_LA_92p_185';n(9) = 89;
mat_file{10} = 'Phantom_GA_185';n(10) = 91;

%%%% 148  Recons
mat_file{11} = 'Phantom_LA_256p_148';n(11) = 91;
mat_file{12} = 'Phantom_LA_185p_148';n(12) = 91;
mat_file{13} = 'Phantom_LA_148p_148';n(13) = 91;
mat_file{14} = 'Phantom_LA_92p_148';n(14) = 89;
mat_file{15} = 'Phantom_GA_148';n(15) = 91;

%%%% 92  Recons
mat_file{16} = 'Phantom_LA_256p_92';n(16) = 91;
mat_file{17} = 'Phantom_LA_185p_92';n(17) = 91;
mat_file{18} = 'Phantom_LA_148p_92';n(18) = 91;
mat_file{19} = 'Phantom_LA_92p_92';n(19) = 89;
mat_file{20} = 'Phantom_GA_92';n(20) = 91;

im = zeros(121,156,8);
x = 175:330;
y = 170:290;

% account for cropping in python
x = x - 86;
y = y - 86;

for i = 1 : 20
    load( sprintf('%s/%s.mat', data_path, mat_file{i}) );    
    im(:,:,i) = flipdim(squeeze(img(n(i),x,y))',1);
    clear img
    disp(sprintf('mat file %d loaded',i));
end

A = abs(im);
A = A-min(A(:));
A = A/max(A(:));
A = reshape(A, [size(A,1) size(A,2) 1 size(A,3)]);

figure; montage(A,'Size',[ 4 ,5]); colormap gray; axis image off
F = getframe;

outfile = sprintf('%s/../figures/Figure_2A_2B.tif', data_path);
imwrite(F.cdata,outfile,'tif');


