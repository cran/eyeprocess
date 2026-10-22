## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# objectives <- item_objective_spec(
#   information = "test_information",
#   process_burden = "pupil_effort",
#   fairness = "absolute_dif",
#   exposure = "exposure_rate",
#   content_constraints = list(content_domain = c(1, 5))
# )
# pareto <- item_pareto_front(item_bank, objectives)
# plot_item_pareto(pareto)
# selected <- optimize_item_bank(
#   pareto,
#   n_items = 20,
#   objectives = objectives,
#   method = "evolutionary"
# )
# plot_selected_bank_profile(selected)
# stability <- audit_bank_decision_stability(selected)
# plot_decision_stability(stability)

## -----------------------------------------------------------------------------
# dif <- fit_process_dif(
#   person_item_data,
#   response = "accuracy",
#   process = "dwell_ms",
#   group = "group",
#   item = "item_id",
#   ability = "theta"
# )
# plot_process_dif_forest(dif)
# drift <- monitor_dif_drift(
#   monitoring_data,
#   time = "deployment_batch",
#   group = "group",
#   metrics = c("difficulty", "dwell_ms", "pupil_auc"),
#   item = "item_id"
# )
# plot_dif_drift_heatmap(drift)

## -----------------------------------------------------------------------------
# norms <- fit_process_norms(reference_sample, "dwell_ms", c("age", "item_difficulty"))
# predict_process_centiles(norms, new_people)
# score_process_deviation(norms, new_people, type = "centile")
# plot_process_centiles(norms)
# audit_norm_transportability(norms, external_sample)

