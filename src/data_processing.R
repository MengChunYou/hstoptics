# data_processing.R

library(sf)
library(dplyr)

# read raw SHP data and filter study area polygons 
village_polygons <- 
  paste("data/empirical/raw/taiwan_village_polygons/",
        "VILLAGE_NLSC_121_1120317.shp", sep = "") %>% 
  st_read(.) %>% 
  filter(COUNTYNAME %in% c("臺北市", "新北市", "基隆市"))

# filter study area accidents