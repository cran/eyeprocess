## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(eyeprocess)
study <- eyeprocess_benchmark_study()
study

## -----------------------------------------------------------------------------
validation <- validate_benchmark_study(study)
validation$valid

reproduction <- run_benchmark_reproduction(study)
reproduction$comparison

## ----eval=FALSE---------------------------------------------------------------
# write_benchmark_data_dictionary(study, "benchmark-data-dictionary.md")
# write_software_paper_reproduction("software-paper-reproduction", study)

## -----------------------------------------------------------------------------
audit_benchmark_release(study)$ready

