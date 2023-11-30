# data_processing.R

library(sf)
library(dplyr)
library(tidyr)

# polygons

## read raw SHP data and filter study area polygons 
study_area_polygons <- 
  paste("data/empirical/raw/taiwan_village_polygons/",
        "VILLAGE_NLSC_121_1120317.shp", sep = "") %>% 
  st_read(.) %>% 
  filter(COUNTYNAME %in% c("臺北市", "新北市", "基隆市"))

## save the filtered polygons
save(study_area_polygons, 
     file = "data/empirical/processed/study_area_polygons.RData")

# accidents

## read accidents data
accidents <- read.csv("data/empirical/raw/accidents/111年度A1交通事故資料.csv")
for (i in 1:12) {
  accidents <- rbind(
    accidents,
    read.csv(paste("data/empirical/raw/accidents/", 
                   "111年度A2交通事故資料_", i, ".csv", sep = ""))
  )
  message(paste("number of accidents:", nrow(accidents)))
}

## filter data

### retain only 1 record for simultaneous accidents
accidents <- accidents %>% 
  distinct(`發生日期`, `發生時間`, `經度`, `緯度`, .keep_all = TRUE)
message(paste("number of unique accidents:", nrow(accidents)))

### exclude highway-related accidents
accidents <- accidents %>% 
  filter(`道路類別.第1當事者.名稱` != "國道")
message(paste("number of accidents after filter:", nrow(accidents)))

### convert to an sf object
accidents_sf <- accidents %>% 
  filter(!is.na(`經度`) & !is.na(`緯度`)) %>% 
  st_as_sf(coords = c("經度", "緯度"), crs = 4326) %>% 
  st_transform(crs = 3826)
message(paste("drop", nrow(accidents) - nrow(accidents_sf), 
              "rows without coords"))
message(paste("number of accidents:", nrow(accidents_sf)))

### retain only accidents within the study area
accidents_sf <- accidents_sf %>% 
  st_filter(st_union(study_area_polygons))
message(paste("number of accidents in study area:", nrow(accidents_sf)))

### exclude accidents that occurred on holidays
accidents_sf <- accidents_sf %>% 
  mutate(`發生日期` = as.character(`發生日期`)) %>% 
  filter(!(`發生日期` %in% read.csv("data/empirical/raw/holidays_2022.csv")$date))
message(paste("number of accidents after filter:", nrow(accidents_sf)))

### exclude accidents that occurred in bad weather condition
accidents_sf <- accidents_sf %>% 
  filter(!(`天候名稱` %in% c("雨", "風沙", "暴雨", "霧或煙", "強風" )))
message(paste("number of accidents after filter:", nrow(accidents_sf)))

## correct the timestamp

### correct `發生時間`
accidents_sf <- accidents_sf %>% 
  mutate(`發生時間` = as.character(`發生時間`)) %>% 
  mutate(`發生時間修正` = (nchar(`發生時間`) != 6), .before = geometry) %>% 
  mutate(`發生時間` = ifelse(
    nchar(`發生時間`) == 5, paste("0", `發生時間`, sep = ""), `發生時間`)) %>% 
  mutate(`發生時間` = ifelse(
    nchar(`發生時間`) == 4, paste("00", `發生時間`, sep = ""), `發生時間`)) %>% 
  mutate(`發生時間` = ifelse(
    nchar(`發生時間`) == 3, paste("000", `發生時間`, sep = ""), `發生時間`)) %>% 
  mutate(`發生時間` = ifelse(
    nchar(`發生時間`) == 2, paste("0000", `發生時間`, sep = ""), `發生時間`)) %>% 
  mutate(`發生時間` = ifelse(
    nchar(`發生時間`) == 1, paste("00000", `發生時間`, sep = ""), `發生時間`))

### convert the occurrence time to POSIXct format
accidents_sf <- accidents_sf %>% 
  mutate(`發生日期時間` = paste(`發生日期`, `發生時間`), .before = `事故類別名稱`) %>% 
  mutate(`發生日期時間` = as.POSIXct(`發生日期時間`, format = "%Y%m%d %H%M%OS")) %>% 
  select(-`發生年度`, -`發生月份`, -`發生日期`, -`發生時間`, -`發生時間修正`)

## modify column names
colnames(accidents_sf) <- colnames(accidents_sf) %>% 
  gsub("\\.", "_", .) %>% 
  gsub("性_別", "性別", .)

## seperate injuries and fatalities
accidents_sf <- accidents_sf %>%
  mutate(`死亡受傷人數` = gsub("[^0-9;]", "", `死亡受傷人數`)) %>% 
  tidyr::separate(`死亡受傷人數`, into = c("死亡人數", "受傷人數"), sep = ";", convert = TRUE)

## save the filtered points
save(accidents_sf, 
     file = "data/empirical/processed/filtered_accidents_points.RData")
