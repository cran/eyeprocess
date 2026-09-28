## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_irt(n_person=60, n_item=10, seed=42)
sim
audit_multimodal_measurement(sim$measurement)

## -----------------------------------------------------------------------------
plot(sim, type="latent_correlation")
plot(sim$measurement, type="availability")

