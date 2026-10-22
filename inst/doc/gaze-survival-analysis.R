## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 4.5)
library(eyeprocess)

## ----raw-inputs---------------------------------------------------------------
raw <- simulate_gaze_survival_inputs(
  "disclosure",
  seed = 20260918,
  n_participants = 36,
  trials_per_participant = 3
)
head(raw$trials)
head(raw$events)

## ----prepare------------------------------------------------------------------
surv_data <- prepare_gaze_survival_data(
  raw$trials,
  raw$events,
  target_aoi = "disclosure",
  event_type = "first_fixation",
  condition_col = "condition_id",
  observation_end_reason_col = "observation_end_reason",
  min_valid_fraction = .90,
  time_origin = "trial_start",
  source_data = "synthetic_disclosure_trial_event_inputs",
  preprocessing_specification = "synthetic_truth_no_filtering",
  event_detector = "synthetic_truth",
  aoi_specification = "fixed synthetic disclosure AOI",
  quality_rules = list(minimum_fixation_ms = 80, valid_fraction_min = .90)
)

summarise_gaze_censoring(surv_data, by = "condition")

## ----verification-example-----------------------------------------------------
verify_raw <- simulate_gaze_survival_inputs(
  "verification",
  seed = 20260918,
  n_participants = 36,
  trials_per_participant = 3
)

verification <- prepare_gaze_survival_data(
  verify_raw$trials,
  verify_raw$events,
  target_aoi = "source_evidence",
  event_type = "first_aoi_entry",
  condition_col = "condition_id",
  min_valid_fraction = .90,
  time_origin = "trial_start",
  event_detector = "synthetic_truth",
  aoi_specification = "fixed synthetic source/evidence AOI"
)

summarise_gaze_censoring(verification, by = "condition")

## ----km-plot, fig.cap="Kaplan–Meier curves for time to first disclosure fixation in the synthetic example."----
plot_gaze_survival_curve(surv_data, group = "condition")

## ----cumulative-incidence-plot, fig.cap="Single-event 1-KM display for time to first disclosure fixation."----
plot_gaze_cumulative_incidence(surv_data, group = "condition")

## ----empirical-hazard-plot, fig.cap="Empirical event/risk increments over time in the synthetic disclosure example."----
plot_gaze_hazard(surv_data, group = "condition")

## ----models-------------------------------------------------------------------
cox_clustered <- fit_gaze_mixed_cox_model(
  surv_data,
  "condition",
  participant_col = "participant_id",
  structure = "cluster_robust"
)
weibull <- fit_gaze_aft_model(surv_data, "condition", distribution = "weibull")
lognormal <- fit_gaze_aft_model(surv_data, "condition", distribution = "lognormal")

tidy_gaze_survival_model(cox_clustered)
tidy_gaze_survival_model(weibull)

## ----compare, warning=FALSE---------------------------------------------------
compare_gaze_survival_models(cox_clustered, weibull, lognormal)

## ----frailty, eval=requireNamespace("coxme", quietly=TRUE)--------------------
frailty <- fit_gaze_mixed_cox_model(
  surv_data,
  "condition",
  participant_col = "participant_id",
  structure = "frailty"
)
tidy_gaze_survival_model(frailty)

## ----diagnostics--------------------------------------------------------------
check_gaze_proportional_hazards(cox_clustered)

## ----sensitivity--------------------------------------------------------------
expanded <- surv_data
expanded$aoi_specification <- "synthetic expanded disclosure AOI"

sensitivity <- compare_gaze_survival_specifications(
  list(primary = surv_data, expanded_aoi_demo = expanded),
  "condition",
  model_families = c("cox_cluster_robust", "aft_weibull")
)
head(sensitivity)

## ----failure-case-------------------------------------------------------------
bad_trials <- raw$trials
bad_trials$valid_data_fraction[1] <- .20
reviewed <- suppressWarnings(prepare_gaze_survival_data(
  bad_trials,
  raw$events,
  target_aoi = "disclosure",
  min_valid_fraction = .90
))
reviewed[1, c("event_observed", "censor_reason", "review_required")]

## ----report-------------------------------------------------------------------
report <- report_gaze_survival_model(cox_clustered)
report[c(
  "N_participants", "N_trials", "N_observed_events",
  "N_censored_trials", "N_review_required", "censoring_percentage",
  "event_type", "target_aoi", "time_origin", "model_family",
  "random_or_frailty_structure", "diagnostic_result"
)]

