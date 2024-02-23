# sample code for tnkde

# loading the data
data(mtl_network)
data(bike_accidents)

# converting the Date field to a numeric field (counting days)
bike_accidents$Time <- as.POSIXct(bike_accidents$Date, format = "%Y/%m/%d")
start <- as.POSIXct("2016/01/01", format = "%Y/%m/%d")
bike_accidents$Time <- difftime(bike_accidents$Time, start, units = "days")
bike_accidents$Time <- as.numeric(bike_accidents$Time)

# creating sample points
lixels <- lixelize_lines(mtl_network, 50)
sample_points <- lines_center(lixels)

# choosing sample in times (every 10 days)
sample_time <- seq(0, max(bike_accidents$Time), 10)

# calculating the densities
tnkde_densities <- tnkde(lines = mtl_network,
                         events = bike_accidents, time_field = "Time",
                         w = rep(1, nrow(bike_accidents)),
                         samples_loc = sample_points,
                         samples_time = sample_time,
                         kernel_name = "quartic",
                         bw_net = 700, bw_time = 60, adaptive = TRUE,
                         trim_bw_net = 900, trim_bw_time = 80,
                         method = "discontinuous", div = "bw",
                         max_depth = 10, digits = 2, tol = 0.01,
                         agg = 15, grid_shape = c(1,1),
                         verbose  = FALSE)
tnkde_densities
