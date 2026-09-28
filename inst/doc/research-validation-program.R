## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# validation <- run_model_validation(
#   simulator = simulate_model,
#   fitter = fit_model,
#   extractor = extract_estimates,
#   truth_extractor = extract_truth,
#   grid = expand.grid(n_person = c(200, 500), n_item = c(20, 40)),
#   spec = model_validation_spec(replications = 500)
# )
# model_validation_summary(validation)
# plot(validation, type = "coverage")

## -----------------------------------------------------------------------------
# grouped_cv(model_data, score ~ process_feature, group = "participant_id")
# crossed_grouped_cv(
#   model_data,
#   score ~ process_feature,
#   groups = c("participant_id", "item_id")
# )
# quantify_process_leakage(model_data, score ~ process_feature)

## -----------------------------------------------------------------------------
# multiverse <- preprocessing_multiverse(
#   dataset,
#   specifications = preprocessing_grid,
#   transform = preprocess_eye,
#   analyse = fit_declared_model,
#   extract = extract_target_estimand
# )
# plot(multiverse)

## -----------------------------------------------------------------------------
# create_public_benchmark(dataset, "benchmark", include_samples = FALSE, overwrite = TRUE)
# write_software_paper_scaffold("paper/eyeprocess-software-paper.Rmd")

## -----------------------------------------------------------------------------
# full_design <- advanced_validation_grid()
# validation_result <- run_model_validation(
#   simulator = simulate_advanced_process_data,
#   fitter = fit_candidate_model,
#   extractor = extract_candidate_parameters,
#   truth_extractor = function(x) x$truth,
#   grid = full_design,
#   spec = model_validation_spec(replications = 500L),
#   seed = 20260804L
# )

