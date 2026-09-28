## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
spec <- eyeprocess::irt_validation_spec(
  model_id = "joint_gaze_rt",
  replications = 500,
  parameters = c("ability", "speed", "engagement"),
  grouped_validation = c("device", "session", "site")
)
spec

## ----eval=FALSE---------------------------------------------------------------
# summary <- summarize_parameter_recovery(recovery)
# audit_bias(summary, threshold = .10)
# audit_rmse(summary, threshold = .30)
# audit_coverage(summary, minimum = .90)
# audit_interval_width(summary)
# audit_convergence(recovery, minimum = .95)
# audit_identifiability(recovery)
# validation_mcse(recovery, "coverage")
# recommended_validation_replications(target_mcse = .01, metric = "coverage")
# plot(summary)

## ----eval=FALSE---------------------------------------------------------------
# sbc <- run_sbc(
#   simulator = function(r) simulate_one_dataset(r),
#   fitter = function(dat) fit_bayesian_model(dat),
#   posterior_draws = function(fit) as.matrix(fit$draws),
#   replications = 250
# )
# 
# audit_sbc(sbc)
# plot(sbc, parameter = "ability_sd")

## ----eval=FALSE---------------------------------------------------------------
# contract <- posterior_sbc_contract(function(replicate, observed_data) {
#   # Model-specific implementation following the posterior-SBC construction.
#   # Must return the simulated truth and posterior draws from the corresponding
#   # conditional self-consistency experiment.
#   list(truth = truth, draws = draws)
# })
# 
# psbc <- run_posterior_sbc(observed_data, contract, replications = 100)
# audit_sbc(psbc)

## ----eval=FALSE---------------------------------------------------------------
# posterior_predictive_discrepancies(
#   observed = observed_fixations,
#   replicated = replicated_fixations,
#   discrepancies = list(
#     mean = mean,
#     sd = sd,
#     zero_rate = function(x) mean(x == 0),
#     p95 = function(x) unname(quantile(x, .95))
#   )
# )

## ----eval=FALSE---------------------------------------------------------------
# stress_test_latent_distribution(runner)
# stress_test_local_dependence(runner)
# stress_test_speededness(runner)
# stress_test_missingness(runner)
# stress_test_preprocessing(runner, variants = c(
#   "default", "strict_validity", "alternate_fixation_detector", "alternate_pupil_filter"
# ))

## ----eval=FALSE---------------------------------------------------------------
# external_validate_irt(train, external, fitter, predictor, scorer)
# leave_device_out_validation(data, "device", fitter, predictor, scorer)
# leave_session_out_validation(data, "session", fitter, predictor, scorer)
# leave_site_out_validation(data, "site", fitter, predictor, scorer)
# leave_item_out_validation(data, "item_id", fitter, predictor, scorer)

## ----eval=FALSE---------------------------------------------------------------
# audit_measurement_transportability(
#   held_out_results,
#   metric = "rmse",
#   higher_is_better = FALSE,
#   max_range = .15
# )

## ----eval=FALSE---------------------------------------------------------------
# inc <- audit_channel_incremental_information(
#   data,
#   fold = "participant_fold",
#   baseline_fitter = fit_response_rt,
#   process_fitter = fit_response_rt_gaze,
#   predictor = predict_trait,
#   scorer = trait_rmse,
#   higher_is_better = FALSE
# )
# plot(inc)
# 
# negative_control_process_test(
#   data,
#   process_columns = c("fixation_count", "evidence_dwell"),
#   within = c("person_id", "item_id"),
#   evaluator = full_crossvalidated_score,
#   permutations = 250,
#   higher_is_better = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# pd <- process_dependent_discrimination_audit(
#   data,
#   response = "correct",
#   theta = "theta",
#   process = "rt_ms",
#   person = "person_id",
#   item = "item_id"
# )
# plot(pd)

## ----eval=FALSE---------------------------------------------------------------
# grade_model_evidence(
#   recovery = recovery,
#   spec = spec,
#   external_validation = held_out_results,
#   sbc = sbc,
#   ppc = ppc,
#   semantic_roundtrip = roundtrip
# )

