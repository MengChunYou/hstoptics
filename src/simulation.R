# simulation.R

library(dplyr)
library(MASS)
library(rgl)

wirte_simulated_data = function(simulated_data, file_order){
  
  # This is a function to write simulated data
  
  # Create a 3D plot when running the script interactively
  if (interactive()) {
    simulated_data %>% 
      plot3d(aspect = F, 
             xlim = c(-10, 10), 
             ylim = c(-10, 10), 
             zlim = c(-10, 10))
  }
  
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

set.seed(123)

line_length <- 3

simulated_data <- data.frame(
  x = rnorm(n_points / 2, mean = 0, sd = 0.5),
  y = line_length * rnorm(n_points / 2),
  t = rnorm(n_points / 2)
)

wirte_simulated_data(simulated_data, 2)

### One Cylinder

set.seed(123)

z <- seq(0, 2 * pi, length.out = n_points)
radius <- 4
noise <- rnorm(n_points, mean = 0, sd = 0.5)

simulated_data <- data.frame(
  x = (radius + noise) * cos(z) ,
  y = (radius + noise) * sin(z) ,
  t = rnorm(n_points, mean = 0, sd = 3)
)

wirte_simulated_data(simulated_data, 3)

### One Horizontal Cross Structure

set.seed(123)

cross_size <- 3

simulated_data <- data.frame(
  x = c(rnorm(n_points / 2, mean = 0, sd = 0.5), 
        cross_size * rnorm(n_points / 2)),
  y = c(cross_size * rnorm(n_points / 2), 
        rnorm(n_points / 2, mean = 0, sd = 0.5)),
  t = rnorm(n_points) * 3
)

wirte_simulated_data(simulated_data, 4)

### One Vertical Cross Structure

set.seed(123)

line_length <- 3

simulated_data <- data.frame(
  x = c(rnorm(n_points / 2, mean = 0, sd = 0.5), 
        rnorm(n_points / 2, mean = 0, sd = 0.5)),
  y = c(rnorm(n_points / 2, mean = 0, sd = 0.5), 
        line_length * rnorm(n_points / 2)),
  t = c(rnorm(n_points / 2) * 3, 
        rnorm(n_points / 2) * 1)
)

wirte_simulated_data(simulated_data, 5)

## Two Clusters

### Two Ellipsoids

set.seed(123)

simulated_data <- 
  rbind(
    mvrnorm(n_points, mu = c(-3, -3, -3), 
            Sigma = matrix(c(1, 0, 0, 0, 2, 0, 0, 0, 3), ncol = 3)),
    mvrnorm(n_points, 
            mu = c(3, 3, 3), 
            Sigma = matrix(c(3, 0, 0, 0, 1, 0, 0, 0, 2), ncol = 3))
  ) %>% 
  as.data.frame() %>% 
  rename(x = V1, y = V2, t = V3)

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

set.seed(123)

simulated_data <- rbind(
  data.frame(
    x = 1 * 3 * (rbeta(n_points, 2, 2) - 0.5), 
    y = 2 * 3 * (rbeta(n_points, 2, 2) - 0.5), 
    t = 3 * 3 * (rbeta(n_points, 2, 2) - 0.5)
  ),
  data.frame(
    x = 4 * 3 * (rbeta(n_points, 2, 2) - 0.5), 
    y = 5 * 3 * (rbeta(n_points, 2, 2) - 0.5), 
    t = 6 * 3 * (rbeta(n_points, 2, 2) - 0.5)
  )
)

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

set.seed(123)

simulated_data <- 
  rbind(
    mvrnorm(n_points, mu = c(0, 0, 0), 
            Sigma = matrix(c(1, 0, 0, 0, 2, 0, 0, 0, 3), ncol = 3)),
    mvrnorm(n_points, 
            mu = c(0, 0, 0), 
            Sigma = matrix(c(7, 0, 0, 0, 8, 0, 0, 0, 9), ncol = 3))
  ) %>% 
  as.data.frame() %>% 
  rename(x = V1, y = V2, t = V3)

wirte_simulated_data(simulated_data, 16)

### Two Overlapping Smooth Linear Structures

wirte_simulated_data(simulated_data, 17)

### Two Overlapping Smooth Cylinders

wirte_simulated_data(simulated_data, 18)

### Two Overlapping Smooth Horizontal Cross Structures

wirte_simulated_data(simulated_data, 19)

### Two Overlapping Smooth Vertical Cross Structures

wirte_simulated_data(simulated_data, 20)
