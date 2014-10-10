%%% CODE FOR RECREATING CMT PAPER FIGURES %%%%%%%%%%%%%%%%%%%%%%%%

%% clean slate
clear all; close all; clc;

%% FIGURE 2AB
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_2AB.m', code_path));

%% FIGURE 2C
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_2C.m', code_path));

%% Figure 3A
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_3A.m', code_path));

%% Figure 3B
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_3B.m', code_path));

%% Figure 4A
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_4A.m', code_path));

%% Figure 4B
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_4B.m', code_path));

%% Figure 5A
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_5A.m', code_path));

%% Figure 5B
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_5B.m', code_path));

%% Figure Supplemental A
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_Supplemental_A.m', code_path));

%% Figure Supplemental B
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Figure_Supplemental_B.m', code_path));

%% Movie Supplemental
code_path = fileparts(mfilename('fullpath'));
run(sprintf('%s/CMT_Movie_Supplemental.m', code_path));
