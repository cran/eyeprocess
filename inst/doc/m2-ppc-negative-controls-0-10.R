## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# library(eyeprocess)
# 
# sim <- simulate_multimodal_m2(
#   n_person = 120,
#   n_item = 12,
#   seed = 55
# )
# 
# fit <- fit_multimodal_m2(sim, seed = 56)
# 
# ppc <- multimodal_m2_ppc(fit)
# ppc
# plot(ppc)

## -----------------------------------------------------------------------------
library(eyeprocess)

sim <- simulate_multimodal_m2(
  n_person = 80,
  n_item = 10,
  seed = 77
)

nc <- multimodal_m2_negative_controls(
  sim,
  seed = 78
)

nc
head(nc$provenance)
plot(nc)

