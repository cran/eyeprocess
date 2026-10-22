## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m4(n_person = 30, n_item = 8, scenario = "weak", seed = 20260820)
audit_multimodal_m4_identifiability(sim, include_posterior = FALSE)
states <- multimodal_m4_state_diagnostics(sim)
states

