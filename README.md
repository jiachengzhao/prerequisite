# Prerequisite for a new PC/Mac before they can do scientific analyses

## Google Earth Engine (GEE)
- Command line tool installation (for PC)
  1. Make sure you have a valid VPN<br/>
  
  2. Conda install<br/>
  Follow [this page](https://developers.google.com/earth-engine/guides/python_install-conda).<br/>
  Maybe add other channels, e.g.,<br/>
  `conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/`<br/>
  `conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/`<br/>
  Change conda to default channel: `conda config --remove-key channels`<br/>
  Set environment variables following [this page](https://stackoverflow.com/questions/44515769/conda-is-not-recognized-as-internal-or-external-command).<br/>
  
  3. Install the Google Cloud CLI<br/>
  Follow [this page](https://cloud.google.com/sdk/docs/install-sdk).<br/>
  
  4. Authentication Earth Engine<br/>
  First set environment variables as<br/>
  name: http_proxy <br/>
  value: socks5://server:port (e.g., socks5://127.0.0.1:7890)<br/>
  name: https_proxy <br/>
  value: socks5://server:port (e.g., socks5://127.0.0.1:7890)<br/>
  and then authenticate Earth Engine
     ```
     set http_proxy=socks5://127.0.0.1:7890
     set https_proxy=socks5://127.0.0.1:7890
     earthengine authenticate
     set http_proxy=
     set https_proxy=
     
     ```
  
  
  5. Make python3 available<br/>
  Follow [this page](https://stackoverflow.com/questions/39910730/python3-is-not-recognized-as-an-internal-or-external-command-operable-program).<br/>
  
  6. Install geeup<br/>
  First re-open Terminal, and enter the ee environment you just created by `conda activate ee`. Install geeup by the command `pip install geeup`. After installation, test it by `geeup -h`.<br/>
  
  7. Disable python aliases (optional)<br/>
  Follow [this page](https://stackoverflow.com/questions/57485491/python-python3-executes-in-command-prompt-but-does-not-run-correctly).<br/>
  
  8. Set up geeup (cookies)<br/>
  Follow [this page](https://samapriya.github.io/geeup/).<br/>
  
  9. Examples<br/>
     - help
     ```
     geeup -h
     ```
     - get metadata
     ```
     geeup getmeta --input "C:/Users/zhao_/Nutstore/1/Nutstore/wc_10m_prec" --metadata "C:/Users/zhao_/Nutstore/1/Nutstore/wc_10m_prec/metadata.csv"
     ```
     - image batch upload
     ```
     geeup upload --source "C:/Users/jzhao/Downloads/tif" --dest "projects/ee-jzhao-external-dataset/assets/raster/urban-climate-in-europe/paris" -m "C:/Users/jzhao/Downloads/tif/metadata.csv" -u "jzhao@nuist.edu.cn"
     ```
     - delete image/image collection
     ```
     geeup delete --id projects/ee-jzhao-crop-response-to-o3/assets/viirs-sr-red-500-filling
     ```
      - upgrade geeup
     ```
     pip install --upgrade geeup
     ```
  
- Command line tool installation (for Mac)
  1. Use /bin/sh<br/>
  Open Terminal on Mac then `command + ,` to Preferences. Change Default login shell to /bin/sh.<br/>
      <br/>
      <img src='images/sh.png' width='500'>
      <br/>
  2. Conda install<br/>
  Follow [this page](https://developers.google.com/earth-engine/guides/python_install-conda).<br/>
  3. Install the Google Cloud CLI<br/>
  Follow [this page](https://cloud.google.com/sdk/docs/install-sdk).<br/>
  4. Install pip on Mac<br/>
  Follow [this page](https://www.geeksforgeeks.org/how-to-install-pip-in-macos/). You may need to install the command line developer tools.<br/>
  5. Set up environmental variables<br/>
     - Create a profile file if you don't have one by opening Terminal and issuing the command `touch .profile`, then close Terminal.<br/>
     - Add the two lines below to the profile file either manually (the file should be hidden in /Users/\<your username>\/.profile) or by `vim ~/.profile`.<br/>
     ```
     export PATH=/Users/<your username>/miniconda3/bin:$PATH
     export PATH=/Users/<your username>/google-cloud-sdk/bin:$PATH
     ```
  6. Install geeup<br/>
  First re-open Terminal, and enter the ee environment you just created by `source $HOME/miniconda3/bin/activate` and then `conda activate ee`. Install geeup by the command `pip install geeup`. After installation, test it by `geeup -h`.<br/>
  7. Set up geeup (cookies)<br/>
  Follow [this page](https://samapriya.github.io/geeup/).<br/>
	
  
  `geeup getmeta --input "C:/Users/jzhao/Downloads/nc" --metadata "C:/Users/jzhao/Downloads/nc/metadata.csv"`
  
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings
https://stackoverflow.com/questions/65348890/python-was-not-found-run-without-arguments-to-install-from-the-microsoft-store
- Image batch upload
```
geeup upload --source "D:/Data/MSWX/Monthly/Processed" --dest "projects/ee-jzhao-external-dataset/assets/raster/mswx/past/monthly" -m "D:/Data/MSWX/Monthly/Processed/metadata.csv" -u "jzhao@nuist.edu.cn"
```


- Reproject image1 to image2
```
image1.resample('bilinear').reproject({
    crs: image2.projection().crs(),
    scale: image2.projection().nominalScale()
});
```

## R
- Import Windows fonts to R
```
install.packages('remotes')
remotes::install_version('Rttf2pt1', version = '1.3.8')
install.packages('extrafont')
extrafont::font_import()
extrafont::loadfonts(device = 'win')
```
- Rstudio header
```
snippet header
	## ----------------------------------
	# Title: 
	# Objective: 
	# Created by: Jiacheng Zhao
	# Created on: `r Sys.Date()`
	# Copyright (c) Jiacheng Zhao, `r format(Sys.Date(), "%Y")`
	# Nanjing University of Information Science & Technology (NUIST)
	# Email: jzhao@nuist.edu.cn
	## ----------------------------------
```
```
snippet par
	# cex --------------------------------
	cex.axis = 1.1
	cex.point = 1.7
	cex.legend = 1
	cex.label = 0.7
	cex.axis.label = 0.8
	cex.title = 1.5
	
	# font -------------------------------
	font = 'Calibri'
	
	# lwd --------------------------------
	lwd = 0.5
	medlwd = 1.3
	boxwex = 0.18
	lwd.axis = 0.5
	
	# axis -------------------------------
	x.axis.line = 2.2; y.axis.line = 1.8
	mgp1 = c(3, 0.1, 0)
	mgp2 = c(3, 0.2, 0)
	mgp3 = c(3, 0.1, 0)
	mgp4 = c(3, 0.2, 0)
	tck = 0.03
	
	# legend -----------------------------
	inset = c(0, 2)
	x.intersp = 0.9; y.intersp = x.intersp
	
	# color ------------------------------
	col = 'red'
	cols = c('seagreen', 'gold')
	
	# par --------------------------------
	par(
	cex.axis = cex.axis,
	family = font,
	las = 1,
	lwd = lwd,
	mai = c(0, 0.5, 0, 0.2),
	mfrow = c(6, 1),
	oma = c(6.5, 1.5, 2, 1),
	tck = tck
	)

```
- Create an r package
```
require(devtools)
setwd('C:/Users/jzhao/Documents/Nutstore/Projects')
create('smot')
```

- Pattern matching and replacement
```
DT[grep('(?=.*A)(?!.*W)', group, perl = T)]
```

## era5cli
- Requests of ERA5-Land hourly data
   ```
   era5cli hourly --land --variables 2m_temperature  --startyear 1950 --endyear 1950 --splitmonths True
   ```



