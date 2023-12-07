# common_functions.R

open_png <- function(filename, width = 960, height = 540) {
  # This function opens a PNG device for graphics output.
  png(filename, width = width, height = height)
}