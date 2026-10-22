## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
scenarios <- c("informative", "weak", "null", "redundant", "confounded")
examples <- lapply(seq_along(scenarios), function(k) {
  simulate_multimodal_m3(
    n_person = 40,
    n_item = 8,
    pupil_signal = scenarios[k],
    seed = 20260815 + k
  )
})

vapply(examples, function(z) audit_multimodal_m3_identifiability(z)$supported, logical(1))

## ----eval=FALSE---------------------------------------------------------------
# rec <- multimodal_m3_recovery(
#   reps = 20,
#   pupil_signal = c("informative", "weak", "null", "redundant", "confounded"),
#   pupil_missingness = c("mcar", "quality", "device"),
#   n_person = 150,
#   n_item = 15,
#   seed = 20260815,
#   fit_args = list(
#     chains = 4,
#     parallel_chains = 4,
#     iter_warmup = 750,
#     iter_sampling = 750,
#     refresh = 0,
#     init = 0
#   )
# )
# 
# rec$summary
# plot(rec, type = "rmse")
# plot(rec, type = "coverage")
# plot(rec, type = "pupil")

