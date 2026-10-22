## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m4(n_person = 30, n_item = 8, seed = 20260820)
audit <- audit_multimodal_m4_identifiability(sim, include_posterior = FALSE)
audit

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_multimodal_m4(sim, spec = multimodal_m4_spec())
# summary(fit)
# fitted(fit, type = "state")

