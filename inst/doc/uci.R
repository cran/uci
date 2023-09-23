## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

use_suggested_pkgs <- (requireNamespace("ggplot2",quietly = TRUE))



## ----eval = FALSE-------------------------------------------------------------
#  # from CRAN
#  install.packages('uci')
#  
#  # development version from GitHub
#  remotes::install_github("ipeaGIT/uci")
#  

## ----eval = TRUE, message = FALSE, warning = FALSE----------------------------
library(uci)
library(sf)

## -----------------------------------------------------------------------------
data_dir <- system.file("extdata", package = "uci")

grid <- readRDS(file.path(data_dir, "grid_bho.rds"))
head(grid)

## ----eval = use_suggested_pkgs, out.width = "80%", fig.width = 6, fig.height = 6----
library(ggplot2)

ggplot(data = grid) +
  geom_sf(aes(fill = jobs), color = NA) +
  scale_fill_viridis_c() +
  theme_void()


## ----eval = TRUE--------------------------------------------------------------
df <- uci(
  sf_object = grid,
  var_name = 'jobs', 
  dist_type = 'euclidean'
  )

head(df)

## ----eval = TRUE--------------------------------------------------------------
df <- uci(
  sf_object = grid,
  var_name = 'jobs', 
  dist_type = 'spatial_link'
  )

head(df)

## ----eval = TRUE--------------------------------------------------------------
df_bootstrap <- uci(
  sf_object = grid,
  var_name = 'jobs',
  bootstrap_border = TRUE,
  showProgress = FALSE
)

head(df_bootstrap)

