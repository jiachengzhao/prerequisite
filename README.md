# Frequently used codes

## Google Earth Engine (GEE)
-  Image batch upload
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
library(remotes)
remotes::install_version("Rttf2pt1", version = "1.3.8")
library(extrafont)
font_import()
loadfonts(device = "win")
fonts()
```




