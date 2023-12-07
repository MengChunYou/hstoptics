# filter_data_visualization.R

library(sf)
library(tmap)
library(dplyr)
library(ggplot2)

# set font family
windowsFonts(JhengHei = windowsFont(family = "Microsoft JhengHei"))

## Filtered accidents map

### Load data
load("data/empirical/processed/study_area_polygons.RData")
load("data/empirical/processed/filtered_accidents_points.RData")

### Plot map
village <- study_area_polygons %>% 
  tm_shape(bbox = st_bbox(study_area_polygons) +
             c(0, 0, 0, -14000)) +
  tm_polygons(border.col = "gray90", alpha = 0)

town <- study_area_polygons %>% group_by(TOWNID) %>% summarise() %>% 
  tm_shape() +
  tm_polygons(border.col = "gray70", alpha = 0)

county <- study_area_polygons %>% group_by(COUNTYID) %>% summarise() %>% 
  tm_shape() +
  tm_polygons(border.col = "gray50", alpha = 0)

accidents <- accidents_sf %>% 
  tm_shape(bbox = st_bbox(study_area_polygons) +
             c(0, 0, 0, 0)) +
  tm_dots(col = "blue", alpha = 0.01, size = 0.005)

#### Open a PNG device for graphics output
open_png("outputs/descriptive_statistics/empirical_data/processed/filtered_accidents_map.png")

#### Create Plot
village + town + county + accidents + 
  tm_layout(frame = F, fontfamily = "JhengHei",
            legend.text.size = 1.5,
            legend.title.size = 2,
            legend.title.fontface = "bold") +
  tm_add_legend("symbol",
                col = "blue", alpha = 0.2, size = 0.5,
                border.alpha = 0,
                labels = c("交通事故點位"),
                title = "圖例", ) +
  tm_add_legend("line",
                col = c("gray90", "gray70", "gray50"),
                labels = c("村里界", "鄉鎮市區界", "縣市界"))

#### Close the PNG device
dev.off()

## Filtered accidents time series

#### Open a PNG device for graphics output
open_png("outputs/descriptive_statistics/empirical_data/processed/filtered_accidents_time_series.png")

#### Create Plot
accidents_sf %>% st_drop_geometry() %>% 
  group_by(`星期`, `時`) %>% 
  summarize(`事故數量` = length(`發生日期時間`)) %>% 
  ggplot(aes(x = `時`, y = `事故數量`))+
  geom_line(col = "blue", lwd = 1, alpha = 0.4) +
  facet_wrap(. ~ `星期`, nrow = 5, strip.position="right") + 
  labs(x = "一日內時段", y = "事故數量 (筆)") + theme_bw() +
  theme(text = element_text(family = "JhengHei", size = 20),
        plot.title = element_text(hjust = 0.5, face = "bold"))

#### Close the PNG device
dev.off()