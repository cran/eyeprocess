## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# p <- process_feature_time_provenance(c("dwell_pre","rt_final"), c(400,1200), outcome_at=c(1000,1000))
# audit_temporal_leakage(p)

## ----eval=FALSE---------------------------------------------------------------
# nc <- run_process_negative_controls(data, outcome="y", analysis_fun=analysis_fun, replications=200)
# summarise_process_negative_controls(nc)
# process_null_benchmark(observed_effect, nc)
# plot(nc)

