## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
rec <- multimodal_m4_recovery()
rec

## ----eval=FALSE---------------------------------------------------------------
# rec_fit <- multimodal_m4_recovery(run = TRUE)
# plot(rec_fit, type = "probability_calibration")

