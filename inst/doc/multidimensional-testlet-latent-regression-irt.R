## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
L <- matrix(c(1,0, 1,0, 0,1, 0,1, 1,0, 0,1), ncol = 2, byrow = TRUE)
loading_spec <- eyeprocess_mirt_loading_spec(paste0("I",1:6), L, c("accuracy","process"), simple_structure = TRUE)
eyeprocess_mirt_loading_audit(loading_spec, min_items_per_dimension = 2)
eyeprocess_mirt_information_matrix(c(0,0), c(1,.5))

