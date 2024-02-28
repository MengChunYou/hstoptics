# simulation.R

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
  message(paste("write", nrow(simulated_data), "data points"))
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
  x = rnorm(n_points, sd = 0.5),
  y = line_length * rnorm(n_points),
  t = rnorm(n_points, sd = 0.5)
)

wirte_simulated_data(simulated_data, 2)

### One Cylinder

set.seed(123)

z <- seq(0, 2 * pi, length.out = n_points)
radius <- 4
noise <- rnorm(n_points, sd = 0.5)

simulated_data <- data.frame(
  x = (radius + noise) * cos(z) ,
  y = (radius + noise) * sin(z) ,
  t = rnorm(n_points) * 3
)

wirte_simulated_data(simulated_data, 3)

### One Horizontal Cross Structure

set.seed(123)

cross_size <- 3

simulated_data <- data.frame(
  x = c(rnorm(n_points / 2, sd = 0.5), 
        cross_size * rnorm(n_points / 2)),
  y = c(cross_size * rnorm(n_points / 2), 
        rnorm(n_points / 2, sd = 0.5)),
  t = rnorm(n_points) * 3
)

wirte_simulated_data(simulated_data, 4)

### One Vertical Cross Structure

set.seed(123)

line_length <- 3

simulated_data <- data.frame(
  x = c(rnorm(n_points, sd = 0.5)),
  y = c(rnorm(n_points / 2, sd = 0.5), 
        line_length * rnorm(n_points / 2)),
  t = c(rnorm(n_points / 2) * 3, 
        rnorm(n_points / 2, sd = 0.5))
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

set.seed(123)

line_length <- 3

simulated_data <- data.frame(
  x = rnorm(n_points * 2, mean = rep(c(-3, 3), each = n_points), sd = 0.5),
  y = line_length * rnorm(n_points * 2),
  t = rnorm(n_points * 2, sd = 0.5)
)

wirte_simulated_data(simulated_data, 7)

### Two Cylinders

set.seed(123)

z <- seq(0, 2 * pi, length.out = n_points)
radius <- rep(c(4, 8), each = n_points)
noise <- rnorm(n_points * 2, sd = 0.5)

simulated_data <- data.frame(
  x = (radius + noise) * cos(z) ,
  y = (radius + noise) * sin(z) ,
  t = rnorm(n_points * 2) * 3
)

wirte_simulated_data(simulated_data, 8)

### Two Horizontal Cross Structures

set.seed(123)

cross_size <- 2

simulated_data <- rbind(
  data.frame(
    x = c(rnorm(n_points / 2, sd = 0.5), 
          cross_size * rnorm(n_points / 2)) - 2,
    y = c(cross_size * rnorm(n_points / 2), 
          rnorm(n_points / 2, sd = 0.5)) - 2,
    t = rnorm(n_points) * cross_size - 2
  ),
  data.frame(
    x = c(rnorm(n_points / 2, sd = 0.5), 
          cross_size * rnorm(n_points / 2)) + 2,
    y = c(cross_size * rnorm(n_points / 2), 
          rnorm(n_points / 2, sd = 0.5)) + 2,
    t = rnorm(n_points) * cross_size + 2
  )
)

wirte_simulated_data(simulated_data, 9)

### Two Vertical Cross Structures

set.seed(123)

line_length <- 3

simulated_data <- rbind(
  data.frame(
    x = c(rnorm(n_points, sd = 0.5)) + 2,
    y = c(rnorm(n_points / 2, sd = 0.5), 
          line_length * rnorm(n_points / 2)) + 2,
    t = c(rnorm(n_points / 2) * 3, 
          rnorm(n_points / 2, sd = 0.5)) + 2
  ),
  data.frame(
    x = c(rnorm(n_points, sd = 0.5)) - 2,
    y = c(rnorm(n_points / 2, sd = 0.5), 
          line_length * rnorm(n_points / 2)) - 2,
    t = c(rnorm(n_points / 2) * 3, 
          rnorm(n_points / 2, sd = 0.5)) - 2
  )
)

wirte_simulated_data(simulated_data, 10)

## Two Overlapping Faulted Clusters

### Two Overlapping Faulted Ellipsoids

set.seed(123)

simulated_data <- 
  rbind(
    data.frame(x = runif(n_points, min = -1, max = 1),
               y = runif(n_points, min = -2, max = 2),
               t = runif(n_points, min = -3, max = 3)),
    data.frame(x = runif(n_points, min = -4, max = 4),
               y = runif(n_points, min = -5, max = 5),
               t = runif(n_points, min = -6, max = 6))
  )

wirte_simulated_data(simulated_data, 11)

### Two Overlapping Faulted Linear Structures

set.seed(123)

wirte_simulated_data(simulated_data, 12)

### Two Overlapping Faulted Cylinders

set.seed(123)

wirte_simulated_data(simulated_data, 13)

### Two Overlapping Faulted Horizontal Cross Structures

set.seed(123)

wirte_simulated_data(simulated_data, 14)

set.seed(123)

### Two Overlapping Faulted Vertical Cross Structures

wirte_simulated_data(simulated_data, 15)

## Two Overlapping Smooth Clusters

### Two Overlapping Smooth Ellipsoids

set.seed(123)

simulated_data <- 
  rbind(
    mvrnorm(n_points, 
            mu = c(0, 0, 0), 
            Sigma = matrix(c(1, 0, 0, 0, 2, 0, 0, 0, 3), ncol = 3)),
    mvrnorm(n_points, 
            mu = c(0, 0, 0), 
            Sigma = matrix(c(4, 0, 0, 0, 5, 0, 0, 0, 6), ncol = 3))
  ) %>% 
  as.data.frame() %>% 
  rename(x = V1, y = V2, t = V3)

wirte_simulated_data(simulated_data, 16)

### Two Overlapping Smooth Linear Structures

set.seed(123)

wirte_simulated_data(simulated_data, 17)

### Two Overlapping Smooth Cylinders

set.seed(123)

wirte_simulated_data(simulated_data, 18)

### Two Overlapping Smooth Horizontal Cross Structures

set.seed(123)

wirte_simulated_data(simulated_data, 19)

### Two Overlapping Smooth Vertical Cross Structures

set.seed(123)

wirte_simulated_data(simulated_data, 20)
