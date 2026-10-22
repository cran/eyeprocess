## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m4(n_person = 30, n_item = 8, seed = 20260820)
controls <- multimodal_m4_negative_controls(sim, seed = 20260821)
controls
sensitivity <- multimodal_m4_sensitivity(sim, n_states = 1:3)
sensitivity

