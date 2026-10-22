## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## ----eval=FALSE---------------------------------------------------------------
# hmm <- fit_process_hmm_irt(
#   data = events,
#   sequence_id = "person_item",
#   process_features = c("stem_dwell", "option_dwell", "transition_rate"),
#   response = "correct",
#   person = "person_id",
#   item = "item_id",
#   n_states = 3
# )
# process_state_occupancy(hmm)
# process_state_transition_summary(hmm)
# plot(hmm)

## ----eval=FALSE---------------------------------------------------------------
# cdm <- fit_cognitive_diagnosis_process(
#   response_matrix = response_matrix,
#   q_matrix = q_matrix,
#   process_data = process_data,
#   process_features = process_features
# )
# 
# mix <- fit_latent_class_process_irt(
#   data,
#   process_features = c("fixation_count", "rt", "transition_entropy"),
#   response = "correct",
#   person = "person_id",
#   item = "item_id",
#   n_classes = 3
# )

## ----eval=FALSE---------------------------------------------------------------
# ls <- fit_latent_space_irt(response_matrix, dimensions = 2)
# map <- process_residual_map(ls)
# plot(ls)
# 
# validate_latent_space_process_similarity(
#   ls,
#   process_matrix = scanpath_feature_matrix
# )

## ----eval=FALSE---------------------------------------------------------------
# surrogate <- process_dif_nuisance_surrogate(
#   data,
#   process_features = c("rt", "fixation_count", "stem_revisits")
# )
# 
# audit_process_adjusted_dif(
#   data,
#   response = "correct",
#   ability = "theta",
#   group = "group",
#   item = "item_id",
#   process_features = c("rt", "fixation_count", "stem_revisits"),
#   person = "participant_id"
# )

## ----eval=FALSE---------------------------------------------------------------
# ngrams <- process_ngram_features(sequences, n = 2:4)
# emb <- process_sequence_embedding(sequences, dimensions = 8)
# fit_response_process_embedding_irt(
#   data,
#   sequences = sequences,
#   response = "correct",
#   person = "person_id",
#   item = "item_id"
# )

## ----eval=FALSE---------------------------------------------------------------
# gp <- fit_gpirt(response_matrix, engine = "spline_reference")
# compare_parametric_nonparametric_irf(gp)
# audit_irf_shape(gp)
# plot(gp)

## ----eval=FALSE---------------------------------------------------------------
# fit_dynamic_gpirt(data, external_engine = my_validated_dynamic_gpirt)
# fit_continuous_time_irt(data, external_engine = my_validated_ct_irt)
# fit_flow_mirt(response_matrix, external_engine = my_validated_flow_mirt)
# fit_variational_irt(response_matrix, external_engine = my_validated_vi_engine)

## ----eval=FALSE---------------------------------------------------------------
# link <- equate_irt_scales(reference_parameters, new_parameters,
#                           method = "stocking_lord")
# plot(link)
# 
# pf <- process_person_fit(
#   joint_fit,
#   data = trials,
#   person = "person_id"
# )
# plot(pf)

## ----eval=FALSE---------------------------------------------------------------
# info <- process_item_information(theta, a, b,
#                                  process_information = process_information,
#                                  rt_information = rt_information,
#                                  weights = c(response = 1, rt = .25, process = .25))
# expected_process_information(info)
# select_next_item_process(theta, item_bank)
# simulate_process_cat(item_bank, true_theta = 0, n_items = 10)

