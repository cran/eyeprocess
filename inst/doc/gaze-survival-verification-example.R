## ----setup, include=FALSE-----------------------------------------------------
library(eyeprocess)

## ----raw----------------------------------------------------------------------
raw <- simulate_gaze_survival_inputs(
  "verification",
  seed = 20260918,
  n_participants = 36,
  trials_per_participant = 3
)

## ----prepare------------------------------------------------------------------
verification <- prepare_gaze_survival_data(
  raw$trials,
  raw$events,
  target_aoi = "source_evidence",
  event_type = "first_aoi_entry",
  condition_col = "condition_id",
  min_valid_fraction = .90,
  time_origin = "trial_start",
  event_detector = "synthetic_truth",
  aoi_specification = "fixed synthetic source/evidence AOI"
)

validate_gaze_survival_data(verification, raise_on_error = FALSE)
summarise_gaze_censoring(verification, by = "condition")

## ----km, fig.cap="Kaplan-Meier curves for time to first source/evidence AOI entry."----
plot_gaze_survival_curve(verification, group = "condition")

## ----incidence, fig.cap="Single-event 1-KM display for time to first source/evidence AOI entry."----
plot_gaze_cumulative_incidence(verification, group = "condition")

## ----hazard, fig.cap="Empirical event/risk increments for the evidence-verification example."----
plot_gaze_hazard(verification, group = "condition")

## ----cox----------------------------------------------------------------------
cox <- fit_gaze_mixed_cox_model(
  verification,
  "condition",
  participant_col = "participant_id",
  structure = "cluster_robust"
)

tidy_gaze_survival_model(cox)
check_gaze_proportional_hazards(cox)

## ----aft----------------------------------------------------------------------
weibull <- fit_gaze_aft_model(
  verification,
  "condition",
  distribution = "weibull"
)
lognormal <- fit_gaze_aft_model(
  verification,
  "condition",
  distribution = "lognormal"
)

compare_gaze_survival_models(cox, weibull, lognormal)

