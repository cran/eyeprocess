## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# spec <- functional_pupil_irt_spec(
#   df = 6L,
#   basis = "natural_spline",
#   response = "score",
#   engine = "stan",
#   alignment = "event",
#   latency_ms = 200,
#   baseline_window = c(-500, 0),
#   baseline_method = "subtract",
#   time_window = c(-200, 2000),
#   luminance_column = "luminance",
#   gaze_x_column = "x",
#   gaze_y_column = "y",
#   blink_column = "blink",
#   interpolated_column = "interpolated",
#   max_interpolated_fraction = 0.20,
#   ar1 = TRUE,
#   participant_effect = TRUE,
#   item_effect = TRUE
# )
# 
# prepared <- prepare_functional_pupil_data(pupil_trials, spec)
# basis <- functional_pupil_basis(prepared$data$time, df = 6)
# fit <- fit_joint_functional_pupil_irt(pupil_trials, spec, seed = 42)

## ----eval=FALSE---------------------------------------------------------------
# extract_functional_pupil_parameters(fit)
# functional_pupil_diagnostics(fit)
# compare_functional_scalar_models(fit)

## ----eval=FALSE---------------------------------------------------------------
# grid <- pupil_preprocessing_grid(
#   baseline_windows = list(c(-500, 0), c(-200, 0)),
#   latency_ms = c(100, 200, 300),
#   basis_df = c(4L, 6L, 8L),
#   baseline_methods = c("subtract", "percent"),
#   max_interpolated_fraction = c(0.10, 0.20)
# )
# 
# sensitivity <- pupil_preprocessing_sensitivity(pupil_trials, grid, spec)
# plot(sensitivity)

