## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
spec <- eyeprocess_joint_process_irt_spec(
  response_family = "2pl", time_model = "lognormal",
  process_channels = c("dwell", "pupil", "transitions"),
  missingness = "ignorable"
)
spec

