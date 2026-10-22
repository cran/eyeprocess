## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
eyeprocess_irt_engine_registry()

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_eyeprocess_mirt(response_matrix, model = 1, itemtype = "2PL")
# validate_eyeprocess_external_irt_fit(fit, engine = "mirt")

