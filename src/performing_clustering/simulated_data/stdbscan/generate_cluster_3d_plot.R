# generate_cluster_3d_plot.R

library(scatterplot3d)  

ii <- "6"
jj <- "1"

simulated_data <- read_cluster_results(
  algorithm_name = "stdbscan",
  combination_order = ii,
  parameter_order = jj)

plot_color = c(rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
plot_lim = 10

simulated_data_w_projection <- simulated_data %>% 
  rbind(., simulated_data)
simulated_data_w_projection[1:nrow(simulated_data),"t"] <- -0.99 * plot_lim

# Open a PNG device for graphics output
open_png(paste(
  "outputs/cluster_plots/simulated_data/",
  "feature_combination_",
  ii,
  "/stdbscan/",
  "parameter_", jj,
  "_cluster_3d_plot.png",
  sep = ""
))

# Create a 3D scatter plot
scatterplot3d(simulated_data_w_projection[, 1:3], 
              pch = 16, asp = T, 
              color = c(rep(rgb(0.8,0.8,0.8,0.2), times = nrow(simulated_data)), 
                        plot_color[simulated_data$cluster]), 
              xlim = c(-1 * plot_lim, plot_lim), 
              ylim = c(-1 * plot_lim, plot_lim), 
              zlim = c(-1 * plot_lim, plot_lim), 
              cex.symbols = 1.5, cex.axis = 1.5, cex.lab = 1.5)

# Close the PNG device
dev.off()