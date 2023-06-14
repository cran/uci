## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  # from CRAN
#  install.packages('uci')
#  
#  # development version from GitHub
#  remotes::install_github("ipeaGIT/uci")
#  

## ---- message = FALSE, warning = FALSE----------------------------------------
library(uci)
library(sf)
library(ggplot2)

## -----------------------------------------------------------------------------
data_dir <- system.file("extdata", package = "uci")

grid <- readRDS(file.path(data_dir, "grid_bho.rds"))
head(grid)

## ---- eval = requireNamespace(c("sf", "ggplot2"), quietly = TRUE), out.width = "80%", fig.width = 6, fig.height = 6----

ggplot(data = grid) +
  geom_sf(aes(fill = jobs), color = NA) +
  scale_fill_viridis_c() +
  theme_void()


## -----------------------------------------------------------------------------
df <- uci(
  sf_object = grid,
  var_name = 'jobs'
  )

head(df)

## -----------------------------------------------------------------------------
df_bootstrap <- uci(
  sf_object = grid,
  var_name = 'jobs',
  bootstrap_border = TRUE,
  showProgress = FALSE
)

head(df_bootstrap)

