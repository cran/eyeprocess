## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# sim <- simulate_dynamic_irtree_data(
#   n_person = 100,
#   n_item = 20,
#   transitions_per_trial = 10,
#   state_misclassification = 0.05,
#   missing_state = 0.10,
#   seed = 42
# )
# 
# spec <- dynamic_irtree_spec(
#   engine = "multinomial",
#   include_person = TRUE,
#   include_item = TRUE,
#   condition_columns = "condition",
#   transition_predictors = c("time_gap", "score"),
#   structural_zeros = data.frame(from = "submit", to = "prompt")
# )
# 
# fit <- fit_dynamic_irtree(sim$transitions, spec)
# decode_dynamic_states(fit)
# transition_residual_diagnostics(fit)

## ----eval=FALSE---------------------------------------------------------------
# hidden_spec <- dynamic_irtree_spec(
#   engine = "stan",
#   hidden_states = 3L,
#   missing_state = "marginalize",
#   person_effect = "random",
#   item_effect = "random",
#   chains = 4L,
#   iter_warmup = 1000L,
#   iter_sampling = 1000L
# )
# 
# hidden_fit <- fit_dynamic_irtree(sim$transitions, hidden_spec, seed = 42)
# probability <- decode_dynamic_states(hidden_fit, method = "probability")

## ----eval=FALSE---------------------------------------------------------------
# baseline <- fit_dynamic_irtree(sim$transitions, dynamic_irtree_spec(engine = "baseline"))
# multinomial <- fit_dynamic_irtree(sim$transitions, dynamic_irtree_spec(engine = "multinomial"))
# compare_dynamic_transition_models(list(baseline = baseline, multinomial = multinomial))
# 
# programme <- dynamic_irtree_recovery(
#   grid = expand.grid(
#     state_misclassification = c(0, 0.05, 0.15),
#     missing_state = c(0, 0.10)
#   ),
#   replications = 200L
# )

