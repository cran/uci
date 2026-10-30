## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

use_suggested_pkgs <- requireNamespace("ggplot2", quietly = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# # from CRAN
# install.packages('uci')
# 
# # development version from GitHub
# remotes::install_github("ipea/uci")
# 

## ----eval = TRUE, message = FALSE, warning = FALSE----------------------------
library(uci)
library(sf)

## ----eval = use_suggested_pkgs, message = FALSE, warning = FALSE--------------
library(ggplot2)

## -----------------------------------------------------------------------------
data_dir <- system.file("extdata", package = "uci")

grid <- readRDS(file.path(data_dir, "grid_bho.rds"))
head(grid)

## ----eval = use_suggested_pkgs, out.width = "80%", fig.width = 6, fig.height = 6----

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

df

## ----eval = TRUE--------------------------------------------------------------
df <- uci(
  sf_object = grid,
  var_name = 'jobs', 
  dist_type = 'spatial_link'
  )

df

## ----eval = TRUE--------------------------------------------------------------
grid_rio <- readRDS(file.path(data_dir, "grid_rio.rds"))

## ----eval = use_suggested_pkgs, out.width = "80%", fig.width = 6, fig.height = 6----
ggplot(data = grid_rio) +
  geom_sf(aes(fill = jobs), color = NA) +
  scale_fill_viridis_c() +
  theme_void()


## ----eval = TRUE--------------------------------------------------------------

df <- uci(
  sf_object = grid_rio,
  var_name = 'jobs',
  dist_type = 'euclidean'
  )

df

## ----eval = TRUE--------------------------------------------------------------
df <- uci(
  sf_object = grid_rio,
  var_name = 'jobs',
  dist_type = 'spatial_link',
  remove_islands = TRUE,
  parallel = FALSE
  )

df

## ----eval = TRUE--------------------------------------------------------------
df_exact <- uci(
  sf_object = grid,
  var_name = 'jobs',
  showProgress = FALSE
)

head(df_exact)

## ----eval = TRUE--------------------------------------------------------------
df_heuristic <- uci(
  sf_object = grid,
  var_name = 'jobs',
  max_method = "heuristic",
  showProgress = FALSE
)

head(df_heuristic)

