## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m4(n_person = 30, n_item = 8, seed = 20260820)
spec <- multimodal_m4_spec(n_states = 2, trait_conditioning = c("theta", "tau"))
print(spec)

