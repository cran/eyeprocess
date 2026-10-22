## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_irt(
  n_person=80, n_item=12, seed=21,
  pupil_luminance=-.25,
  gaze_x_effect=.10,
  gaze_y_effect=-.06
)
summary(sim$data[c("pupil_response","luminance_z","gaze_x_z","gaze_y_z")])

## -----------------------------------------------------------------------------
plot(sim, type="channel_distributions")

