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

n_points <- 500
noise_ratio <- 0.1

## Only noise

set.seed(123)

simulated_data <- 
  data.frame(x = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
             y = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
             t = runif(n_points * noise_ratio, min = -9.9, max = 9.9))

wirte_simulated_data(simulated_data, 1)

## One Cluster with noise

set.seed(123)

simulated_data <- 
  rbind(
    data.frame(x = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               y = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               t = runif(n_points * noise_ratio, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -1, max = 1),
               y = runif(n_points * (1 - noise_ratio), min = -2, max = 2),
               t = runif(n_points * (1 - noise_ratio), min = -1, max = 1))
  )

wirte_simulated_data(simulated_data, 2)

## Two Cluster with noise

set.seed(123)

simulated_data <- 
  rbind(
    data.frame(x = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               y = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               t = runif(n_points * noise_ratio, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -1 - 2, max = 1 - 2),
               y = runif(n_points * (1 - noise_ratio), min = -2 - 2, max = 2 - 2),
               t = runif(n_points * (1 - noise_ratio), min = -1 - 2, max = 1 - 2)),
    data.frame(t = runif(n_points * (1 - noise_ratio), min = -2 + 2, max = 2 + 2),
               x = runif(n_points * (1 - noise_ratio), min = -1 + 2, max = 1 + 2),
               y = runif(n_points * (1 - noise_ratio), min = -1 + 2, max = 1 + 2))
  )

wirte_simulated_data(simulated_data, 3)

## 1 low density cluster, 1 high density cluster, noise

set.seed(123)

simulated_data <- 
  rbind(
    data.frame(x = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               y = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               t = runif(n_points * noise_ratio, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -1, max = 1),
               y = runif(n_points * (1 - noise_ratio), min = -2, max = 2),
               t = runif(n_points * (1 - noise_ratio), min = -1, max = 1)),
    data.frame(t = runif(n_points * (1 - noise_ratio), min = -2 - 3, max = 2 + 3),
               x = runif(n_points * (1 - noise_ratio), min = -1 - 3, max = 1 + 3),
               y = runif(n_points * (1 - noise_ratio), min = -1 - 3, max = 1 + 3))
  )

wirte_simulated_data(simulated_data, 4)

## 1 low density cluster, 2 high density cluster, noise

set.seed(123)

simulated_data <- 
  rbind(
    data.frame(x = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               y = runif(n_points * noise_ratio, min = -9.9, max = 9.9),
               t = runif(n_points * noise_ratio, min = -9.9, max = 9.9)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -1 - 3, max = 1 - 3),
               y = runif(n_points * (1 - noise_ratio), min = -1, max = 1),
               t = runif(n_points * (1 - noise_ratio), min = -2, max = 2)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -1 + 3, max = 1 + 3),
               y = runif(n_points * (1 - noise_ratio), min = -1, max = 1),
               t = runif(n_points * (1 - noise_ratio), min = -2, max = 2)),
    data.frame(x = runif(n_points * (1 - noise_ratio), min = -2 - 4, max = 2 + 4),
               y = runif(n_points * (1 - noise_ratio), min = -1 - 3, max = 1 + 3),
               t = runif(n_points * (1 - noise_ratio), min = -1 - 3, max = 1 + 3))
  )

wirte_simulated_data(simulated_data, 5)
