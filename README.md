# Frequently used codes

## Google Earth Engine (GEE)
- Command line tool installation
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


