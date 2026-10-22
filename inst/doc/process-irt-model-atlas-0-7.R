## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
validation_evidence_levels()
list_irt_models()

## ----eval=FALSE---------------------------------------------------------------
# inc <- audit_channel_incremental_information(
#   data = trials,
#   fold = "participant_id",
#   baseline_fitter = fit_without_gaze,
#   process_fitter = fit_with_gaze,
#   predictor = predict_model,
#   scorer = score_model,
#   higher_is_better = TRUE
# )
# plot(inc)
# 
# neg <- negative_control_process_test(
#   data = trials,
#   process = "dwell_time",
#   fold = "participant_id",
#   fitter = fit_with_gaze,
#   predictor = predict_model,
#   scorer = score_model
# )
# plot(neg)

## ----eval=FALSE---------------------------------------------------------------
# miss <- classify_item_missingness(
#   trials,
#   response = "response",
#   reached = "reached",
#   inspected = "inspected",
#   started = "response_started"
# )
# 
# fit <- fit_gaze_informed_missingness_irt(
#   trials,
#   response = "response",
#   person = "participant_id",
#   item = "item_id",
#   gaze_exposure = "item_dwell_ms",
#   theta = "theta"
# )
# plot(fit)

## ----eval=FALSE---------------------------------------------------------------
# facets <- fit_manyfacet_process_irt(
#   trials,
#   response = "correct",
#   process = "dwell_ms",
#   person = "participant_id",
#   item = "item_id",
#   device = "device",
#   session = "session",
#   algorithm = "fixation_algorithm"
# )
# 
# device_facet_effects(facets, channel = "process")
# session_facet_effects(facets, channel = "process")
# algorithm_facet_effects(facets, channel = "process")
# audit_process_measurement_invariance(facets)

## ----eval=FALSE---------------------------------------------------------------
# audit_latent_distribution(theta)
# compare_latent_distribution_models(theta)
# latent_distribution_stress_test(validation_runner)
# 
# shape <- fit_gpirt(response_matrix, engine = "spline_reference")
# plot_irf_uncertainty(shape, item = 1)
# cmp <- compare_parametric_nonparametric_irf(response_matrix, shape)
# audit_irf_shape(cmp)

## ----eval=FALSE---------------------------------------------------------------
# spec <- irt_validation_spec("joint_gaze_rt", replications = 500)
# 
# # retained recovery/SBC/PPC/transport results are combined into an evidence bundle
# grade_model_evidence(evidence_bundle)

