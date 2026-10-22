## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sp <- eyeprocess_stress_evidence_plan()
head(expand_eyeprocess_stress_evidence_plan(sp))
eyeprocess_reliability_evidence_plan()
eyeprocess_negative_control_evidence_plan()

