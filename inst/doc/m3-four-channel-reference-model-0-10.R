## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m3(
  n_person = 60,
  n_item = 10,
  seed = 20260815
)

audit <- audit_multimodal_m3_identifiability(sim)
print(audit)

## ----fig.width=8, fig.height=5------------------------------------------------
plot(sim, type = "channels")
plot(sim, type = "pupil_confounds")

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_multimodal_m3(
#   sim,
#   chains = 4,
#   parallel_chains = 4,
#   iter_warmup = 1000,
#   iter_sampling = 1000,
#   adapt_delta = 0.95,
#   seed = 20260815,
#   init = 0
# )
# 
# summary(fit)
# validate_multimodal_m3(fit)
# plot(fit, type = "person_correlations")
# plot(fit, type = "pupil_nuisance")

