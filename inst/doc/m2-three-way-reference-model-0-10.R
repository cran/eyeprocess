## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(eyeprocess)

spec <- multimodal_m2_spec()
spec

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m2(
  n_person = 80,
  n_item = 10,
  seed = 20260814
)

head(sim$data)
sim

## -----------------------------------------------------------------------------
audit <- audit_multimodal_m2_identifiability(sim$data)
audit

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_multimodal_m2(
#   sim,
#   chains = 4,
#   parallel_chains = 4,
#   iter_warmup = 1000,
#   iter_sampling = 1000,
#   seed = 9001
# )
# 
# summary(fit)
# plot(fit, type = "person_correlations")
# plot(fit, type = "item_correlations")
# plot(fit, type = "item_parameters")

