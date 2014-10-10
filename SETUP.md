MRM Sengupta CMT Golden Angle
=============================

Requirements:
-------------
* Python - for image reconstruction
* MATLAB - for figure creation

Tested Configuration:
---------------------
* Mac OS X 10.7.5 (Lion)
* Python 2.7.8 Anaconda 2.0.1 (x86_64) 
* MATLAB R0210a

Installation Options:
---------------------
* Click the `Download ZIP` button on the lower right hand side of the repository to download the code to your local machine
* OR clone the git repository to your local machine
* OR fork to your own GitHub repository and then clone the git repository to your local machine

Usage Steps:
------------
* Run `./code/download_data_all.m` or `./code/download_data_all.py` to download the raw CMT *k*-space data files in MATLAB .mat V5 format to the `../data_input/` folder.

* Run `./code/CMT_Recon.py` to generate 32 reconstructions (about 1 GB each). Output data files are written to the `./data_output/` folder.

* Run `./code/CMT_Figure_*.m` to reproduce figures from the paper. Figures are written in .tif format in the `./figures/` folder. All figures can be created by executing `./code/CMT_Figures_Create_All.m`.
  
Example:
--------

* Raw Data File :  `Human_LA_256p.mat` : Linear Angle data acquired with 256 profiles per 180 degrees.

* Reconstructed Data File : `Human_LA_256p_203.mat` : Above data set reconstructed with 203 profiles per slice.

* Figure File : `Figure_2A_2B.tif` : Figure_2A_2B reproduced from above (and other) reconstructed image volumes.

Notes:
------
* The scripts `./code/download_data_verify_all.py` and `./code/download_data_verify_all.m` verify the MD5 hash values for all `./data_input/` files.
* Files in `./data_input/`, `./data_output/`, and `./figures/` (other than `README.md`) are ignored when performing `git commit`.