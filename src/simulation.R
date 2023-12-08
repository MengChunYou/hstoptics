# simulation.R

library(dplyr)
library(MASS)

wirte_simulated_data = function(simulated_data, file_order){
  # This is a function to write simulated data
  write.csv( 
    simulated_data, 
    file = paste(
      "data/simulated/feature_combination_",
      file_order,
      ".csv",
      sep = ""
    ),
    row.names = F)
}

n_points <- 200

## One Cluster

### One Ellipsoid

set.seed(123)

simulated_data <- 
  mvrnorm(n_points, 
          mu = c(0, 0, 0), 
          Sigma = matrix(c(1, 0, 0, 0, 2, 0, 0, 0, 3), ncol = 3)) %>% 
  as.data.frame() %>% 
  rename(x = V1, y = V2, t = V3)

wirte_simulated_data(simulated_data, 1)

### One Linear Structure

wirte_simulated_data(simulated_data, 2)

### One Cylinder

# 生成虛擬資料
set.seed(123)
x <- rnorm(n_points)
y <- rnorm(n_points)
t <- seq(0, 2 * pi, length.out = n_points)

# 設定圓筒型的半徑和高度
radius <- 1.5
height <- 2

# 將資料轉換成圓筒型
simulated_data <- data_frame(
  x = radius * cos(t),
  y = radius * sin(t),
  t = sample(seq(0, height, length.out = n_points), n_points, T)
)

wirte_simulated_data(simulated_data, 3)

### One Horizontal Cross Structure

# 生成虛擬資料
set.seed(123)
x <- rnorm(n_points)
y <- rnorm(n_points)
t <- rnorm(n_points)

# 設定十字體的尺寸
cross_size <- 2

# 將資料轉換成橫躺的十字體
simulated_data <- data.frame(
  x = c(rep(0, n_points), cross_size * x),
  y = c(cross_size * y, rep(0, n_points)),
  t = c(rep(t, each = 2))
)

wirte_simulated_data(simulated_data, 4)

### One Vertical Cross Structure

wirte_simulated_data(simulated_data, 5)

## Two Clusters

### Two Ellipsoids

wirte_simulated_data(simulated_data, 6)

### Two Linear Structures

wirte_simulated_data(simulated_data, 7)

### Two Cylinders

wirte_simulated_data(simulated_data, 8)

### Two Horizontal Cross Structures

wirte_simulated_data(simulated_data, 9)

### Two Vertical Cross Structures

wirte_simulated_data(simulated_data, 10)


## Two Overlapping Faulted Clusters

### Two Overlapping Faulted Ellipsoids

wirte_simulated_data(simulated_data, 11)

### Two Overlapping Faulted Linear Structures

wirte_simulated_data(simulated_data, 12)

### Two Overlapping Faulted Cylinders

wirte_simulated_data(simulated_data, 13)

### Two Overlapping Faulted Horizontal Cross Structures

wirte_simulated_data(simulated_data, 14)

### Two Overlapping Faulted Vertical Cross Structures

wirte_simulated_data(simulated_data, 15)


## Two Overlapping Smooth Clusters

### Two Overlapping Smooth Ellipsoids

wirte_simulated_data(simulated_data, 16)

### Two Overlapping Smooth Linear Structures

wirte_simulated_data(simulated_data, 17)

### Two Overlapping Smooth Cylinders

wirte_simulated_data(simulated_data, 18)

### Two Overlapping Smooth Horizontal Cross Structures

wirte_simulated_data(simulated_data, 19)

### Two Overlapping Smooth Vertical Cross Structures

wirte_simulated_data(simulated_data, 20)
