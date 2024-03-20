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

## Only noise

set.seed(123)



wirte_simulated_data(simulated_data, 1)

## One Cluster with noise

set.seed(123)



wirte_simulated_data(simulated_data, 2)

## Two Cluster with noise

set.seed(123)



wirte_simulated_data(simulated_data, 3)

## 1 low density cluster, 1 high density cluster, noise

set.seed(123)



wirte_simulated_data(simulated_data, 4)

## 1 low density cluster, 2 high density cluster, noise

set.seed(123)



wirte_simulated_data(simulated_data, 5)
