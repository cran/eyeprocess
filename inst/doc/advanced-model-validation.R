## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# dynamic <- fit_dynamic_irtree(
#   dataset,
#   dynamic_irtree_spec(source = "samples", include_response = TRUE)
# )
# plot(dynamic)

## -----------------------------------------------------------------------------
# pupil_fit <- fit_joint_functional_pupil_irt(
#   dataset,
#   functional_pupil_irt_spec(df = 5, engine = "two_stage_lme4")
# )
# plot(pupil_fit)

## -----------------------------------------------------------------------------
# prototypes <- rbind(
#   constructive = c(matrix_dwell = 0.8, toggling = -0.5),
#   elimination = c(matrix_dwell = -0.4, toggling = 0.9)
# )
# strategy_fit <- fit_theory_strategy_irt(
#   dataset,
#   theory_strategy_spec(prototypes)
# )
# plot(strategy_fit)

## -----------------------------------------------------------------------------
# diffusion <- fit_gaze_diffusion_irt(
#   dataset,
#   gaze_diffusion_spec(
#     engine = "ez_regression",
#     gaze_features = c("dwell_time_ms", "first_fixation_latency_ms")
#   )
# )
# plot(diffusion)

## -----------------------------------------------------------------------------
# grid <- advanced_validation_grid(quick = TRUE)
# head(grid)
# 
# simulation <- do.call(
#   simulate_advanced_process_data,
#   c(as.list(grid[1, ]), list(seed = 20260804L))
# )
# str(simulation, max.level = 1)

## -----------------------------------------------------------------------------
# evidence <- list(
#   fit_process_irt = list(
#     recovery = recovery_result,
#     calibration = sbc_result,
#     misspecification = misspecification_result,
#     grouped_validation = grouped_result,
#     engine_equivalence = engine_result,
#     empirical_reproduction = reproduction_result,
#     sensitivity = multiverse_result
#   )
# )
# model_audit <- audit_advanced_model_evidence(evidence)
# plot(model_audit)
# write_advanced_model_evidence_report(model_audit, "validation/advanced-model-evidence.md")

