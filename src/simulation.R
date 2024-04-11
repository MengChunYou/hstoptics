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
      "simulated_data/feature_combination_",
      file_order,
      ".csv",
      sep = ""
    ),
    row.names = F)
  message(paste("write", nrow(simulated_data), "data points"))
}

n_noise_points <- 30

## Only noise

set.seed(123)

simulated_data <- 
  data.frame(x = runif(n_noise_points, min = -9.9, max = 9.9),
             y = runif(n_noise_points, min = -9.9, max = 9.9),
             t = runif(n_noise_points, min = -9.9, max = 9.9))

wirte_simulated_data(simulated_data, 1)

## One Cluster with noise

set.seed(123)

x_range <- c(-1, 1)
y_range <- c(-2, 2)
t_range <- c(-1, 1)

density <- 50
n_points <- density * (x_range[2] - x_range[1]) * (y_range[2] - y_range[1]) * (t_range[2] - t_range[1])

simulated_data <- 
  rbind(
    data.frame(x = runif(n_noise_points, min = -9.9, max = 9.9),
               y = runif(n_noise_points, min = -9.9, max = 9.9),
               t = runif(n_noise_points, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points, min = x_range[1], max = x_range[2]),
               y = runif(n_points, min = y_range[1], max = y_range[2]),
               t = runif(n_points, min = t_range[1], max = t_range[2]))
  )

wirte_simulated_data(simulated_data, 2)

## Two Cluster with noise

set.seed(123)

x_range_1 <- c(-1 - 2, 1 - 2)
y_range_1 <- c(-2 - 2, 2 - 2)
t_range_1 <- c(-1 - 2, 1 - 2)

density_1 <- 50
n_points_1 <- 
  density_1 * (x_range_1[2] - x_range_1[1]) * (y_range_1[2] - y_range_1[1]) * (t_range_1[2] - t_range_1[1])

x_range_2 <- c(-2 + 2, 2 + 2)
y_range_2 <- c(-1 + 2, 1 + 2)
t_range_2 <- c(-1 + 2, 1 + 2)

density_2 <- 50
n_points_2 <- 
  density_2 * (x_range_2[2] - x_range_2[1]) * (y_range_2[2] - y_range_2[1]) * (t_range_2[2] - t_range_2[1])

simulated_data <- 
  rbind(
    data.frame(x = runif(n_noise_points, min = -9.9, max = 9.9),
               y = runif(n_noise_points, min = -9.9, max = 9.9),
               t = runif(n_noise_points, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points_1, min = x_range_1[1], max = x_range_1[2]),
               y = runif(n_points_1, min = y_range_1[1], max = y_range_1[2]),
               t = runif(n_points_1, min = t_range_1[1], max = t_range_1[2])),
    data.frame(x = runif(n_points_2, min = x_range_2[1], max = x_range_2[2]),
               y = runif(n_points_2, min = y_range_2[1], max = y_range_2[2]),
               t = runif(n_points_2, min = t_range_2[1], max = t_range_2[2]))
  )

wirte_simulated_data(simulated_data, 3)

## 1 low density cluster, 1 high density cluster, noise

set.seed(123)

x_range_1 <- c(-1, 1)
y_range_1 <- c(-2, 2)
t_range_1 <- c(-1, 1)

density_1 <- 50
n_points_1 <- 
  density_1 * (x_range_1[2] - x_range_1[1]) * (y_range_1[2] - y_range_1[1]) * (t_range_1[2] - t_range_1[1])

x_range_2 <- c(-5, 5)
y_range_2 <- c(-3, 3)
t_range_2 <- c(-3, 3)

density_2 <- 5
n_points_2 <- 
  density_2 * (x_range_2[2] - x_range_2[1]) * (y_range_2[2] - y_range_2[1]) * (t_range_2[2] - t_range_2[1])

simulated_data <- 
  rbind(
    data.frame(x = runif(n_noise_points, min = -9.9, max = 9.9),
               y = runif(n_noise_points, min = -9.9, max = 9.9),
               t = runif(n_noise_points, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points_1, min = x_range_1[1], max = x_range_1[2]),
               y = runif(n_points_1, min = y_range_1[1], max = y_range_1[2]),
               t = runif(n_points_1, min = t_range_1[1], max = t_range_1[2])),
    data.frame(x = runif(n_points_2, min = x_range_2[1], max = x_range_2[2]),
               y = runif(n_points_2, min = y_range_2[1], max = y_range_2[2]),
               t = runif(n_points_2, min = t_range_2[1], max = t_range_2[2]))
  )

wirte_simulated_data(simulated_data, 4)

## 1 low density cluster, 2 high density cluster, noise

set.seed(123)

x_range_1 <- c(-3, -1)
y_range_1 <- c(-1, 1)
t_range_1 <- c(-2, 2)

density_1 <- 50
n_points_1 <- 
  density_1 * (x_range_1[2] - x_range_1[1]) * (y_range_1[2] - y_range_1[1]) * (t_range_1[2] - t_range_1[1])

x_range_2 <- c(1, 3)
y_range_2 <- c(-1, 1)
t_range_2 <- c(-2, 2)

density_2 <- 50
n_points_2 <- 
  density_2 * (x_range_2[2] - x_range_2[1]) * (y_range_2[2] - y_range_2[1]) * (t_range_2[2] - t_range_2[1])

x_range_3 <- c(-5, 5)
y_range_3 <- c(-3, 3)
t_range_3 <- c(-3, 3)

density_3 <- 5
n_points_3 <- 
  density_3 * (x_range_3[2] - x_range_3[1]) * (y_range_3[2] - y_range_3[1]) * (t_range_3[2] - t_range_3[1])

simulated_data <- 
  rbind(
    data.frame(x = runif(n_noise_points, min = -9.9, max = 9.9),
               y = runif(n_noise_points, min = -9.9, max = 9.9),
               t = runif(n_noise_points, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points_1, min = x_range_1[1], max = x_range_1[2]),
               y = runif(n_points_1, min = y_range_1[1], max = y_range_1[2]),
               t = runif(n_points_1, min = t_range_1[1], max = t_range_1[2])),
    data.frame(x = runif(n_points_2, min = x_range_2[1], max = x_range_2[2]),
               y = runif(n_points_2, min = y_range_2[1], max = y_range_2[2]),
               t = runif(n_points_2, min = t_range_2[1], max = t_range_2[2])),
    data.frame(x = runif(n_points_3, min = x_range_3[1], max = x_range_3[2]),
               y = runif(n_points_3, min = y_range_3[1], max = y_range_3[2]),
               t = runif(n_points_3, min = t_range_3[1], max = t_range_3[2]))
  )

wirte_simulated_data(simulated_data, 5)