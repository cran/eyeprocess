## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m3(
  n_person = 60,
  n_item = 10,
  pupil_missingness = "quality",
  seed = 20260815
)

audit <- audit_multimodal_m3_identifiability(sim)
audit$pupil$nuisance

## ----fig.width=8, fig.height=5------------------------------------------------
plot(sim, type = "pupil_confounds")
plot(audit, type = "missingness")
plot(audit, type = "device")

## -----------------------------------------------------------------------------
mechanisms <- c("mcar", "quality", "gaze", "ability", "device")
missing <- vapply(mechanisms, function(m) {
  z <- simulate_multimodal_m3(
    n_person = 40,
    n_item = 8,
    pupil_missingness = m,
    seed = 100 + match(m, mechanisms)
  )
  mean(is.na(z$data$pupil))
}, numeric(1))
missing

