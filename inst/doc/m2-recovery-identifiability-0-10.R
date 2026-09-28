## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(eyeprocess)

sim <- simulate_multimodal_m2(
  n_person = 100,
  n_item = 10,
  dropout = c(response = .02, rt = .05, gaze = .10),
  seed = 101
)

audit_multimodal_m2_identifiability(sim$data)

## ----eval=FALSE---------------------------------------------------------------
# rec <- multimodal_m2_recovery(
#   n_rep = 25,
#   n_person = 150,
#   n_item = 15,
#   chains = 4,
#   parallel_chains = 4,
#   iter_warmup = 1000,
#   iter_sampling = 1000,
#   base_seed = 20261001
# )
# 
# rec
# plot(rec, type = "truth_vs_estimate")
# plot(rec, type = "coverage")

