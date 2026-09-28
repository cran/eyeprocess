## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m3(n_person = 40, n_item = 8, seed = 20260815)
d <- sim$data

# Demonstration only. In a real workflow this should be an output from the
# package's functional/deconvolution pipeline with its provenance retained.
d$functional_score <- as.numeric(scale(d$pupil_baseline))

bridge <- multimodal_m3_functional_bridge(
  d,
  score = "functional_score",
  provenance = "demonstration score; replace with validated functional-pupil derivation"
)
print(bridge)

## -----------------------------------------------------------------------------
spec <- multimodal_m3_spec(pupil_representation = "functional_score")
print(spec)

