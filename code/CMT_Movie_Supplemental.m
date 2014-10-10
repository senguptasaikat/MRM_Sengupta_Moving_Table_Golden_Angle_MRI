
%%% CODE FOR RECREATING CMT PAPER MOVIE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Script to recreate Supplemental Human Data Movie.
%%% The script reads reconstructed data from the ../data_output/ folder.

%%%  SUPPLEMENTAL MATERIAL : MOVIE FOR LA vs GA Flythrough

% clean slate
clear all; close all; clc;

fig=figure;

x = 95:425;
y = 128:360;

% account for cropping in python
x = x - 86;
y = y - 86;

code_path = fileparts(mfilename('fullpath'));
data_path = sprintf('%s/../data_output', code_path);

img_LA = load( sprintf('%s/Human_LA_256p_256.mat', data_path) );
img_GA = load( sprintf('%s/Human_GA_256.mat', data_path) );

img_LA = flipdim(img_LA,2);
img_GA = flipdim(img_GA,2);

dest_filename = sprintf('%s/../figures/LA_vs_GA_13.8mm.gif', data_path);

frame_idx = 8:1136;
num_frames = length(frame_idx);
tic;
for idx=1:num_frames,
    
    I_LA = flipdim(abs(squeeze(img_LA.img(frame_idx(idx),x,y))),2)';
    I_GA = flipdim(abs(squeeze(img_GA.img(frame_idx(idx),x,y))),2)';
    
    I_LA = imadjust(I_LA,[0; 0.25],[0;1]) ;
    I_GA = imadjust(I_GA,[0; 0.25],[0;1]) ;
      
    I = [ I_LA I_GA];
    
    subplot('position',[0.0 0.0 1.0 1.0])
    h =  imagesc(I); 
    colormap gray; axis image off;
    ht1 = text(round(1/4*size(I,2))-50, size(I,1)-10, 'LINEAR ANGLE');
    ht2 = text(round(3/4*size(I,2))-50, size(I,1)-10, 'GOLDEN ANGLE');
    set(ht1, 'fontsize', 12, 'color', 'w');
    set(ht2, 'fontsize', 12, 'color', 'w');
    
    if idx == 1,
        pos = get(fig,'Position');
        set(fig,'Position',[pos(1) pos(2) size(I,2) size(I,1)]);
        drawnow;
    end
    
    F = getframe(fig);
    [ X,Map] = frame2im(F);
    
    [imind,cm] = rgb2ind(X,256);
  
    if idx == 1;
          imwrite(imind,cm,dest_filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
          imwrite(imind,cm,dest_filename,'gif','WriteMode','append');
    end
  
    if idx == 1,
        fprintf('Captured %04d of %04d frames', idx, num_frames);
    end
    
    if mod(idx,20)==0,
        fprintf('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');
        fprintf('%04d of %04d frames', idx, num_frames);
    end
    
end
fprintf('\n', idx, num_frames);
toc;
