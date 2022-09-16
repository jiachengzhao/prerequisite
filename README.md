# Frequently used codes

## Google Earth Engine (GEE)
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
  5. Set environmental variables up<br/>
     - Create a profile file if you don't have one by opening Terminal and issuing the command `touch .profile`, then close Terminal.<br/>
     - Add the two lines below to the profile file either manully (the file should be hidden in /Users/\<your username>\/.profile) or by `vim ~/.profile`.<br/>
     ```
     export PATH=/Users/<your username>/miniconda3/bin:$PATH
     export PATH=/Users/<your username>/google-cloud-sdk/bin:$PATH
     ```
  6. Install geeup<br/>
  Follow [this page](https://samapriya.github.io/geeup/).<br/>
	
  
  
  
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings
https://stackoverflow.com/questions/65348890/python-was-not-found-run-without-arguments-to-install-from-the-microsoft-store
- Image batch upload
```
geeup upload --source "D:/Data/MSWX/Monthly/Processed" --dest "projects/ee-jzhao-external-dataset/assets/raster/mswx/past/monthly" -m "D:/Data/MSWX/Monthly/Processed/metadata.csv" -u "zhao_jiacheng@outlook.com"
```
## R
- Create an r package
```
require(devtools)
setwd('C:/Users/jzhao/Documents/Nutstore/Projects')
create('smot')
```
- Import windows fonts to rstudio
```
install.packages('remotes')
library(remotes)
remotes::install_version("Rttf2pt1", version = "1.3.8")
install.packages('extrafont')
library(extrafont)
font_import()
loadfonts(device = "win")
fonts()
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
	# Beijing Normal University
	# Email: zhaojiacheng@mail.bnu.edu.cn
	## ----------------------------------
```


