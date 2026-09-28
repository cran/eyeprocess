## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# process_measure_registry()
# process_measure_card("pupil_peak")
# process_measure_guardrails()

## ----eval=FALSE---------------------------------------------------------------
# r <- read.csv(system.file("extdata","reliability_demo.csv", package="eyeprocess"))
# process_icc(r, "person_id", "session", "dwell_time")
# profile <- process_reliability_profile(r, "person_id", "session", "dwell_time")
# plot(profile, type="bland_altman")

