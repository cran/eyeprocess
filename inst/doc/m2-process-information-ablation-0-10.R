## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# library(eyeprocess)
# 
# sim <- simulate_multimodal_m2(
#   n_person = 150,
#   n_item = 15,
#   seed = 220
# )
# 
# abl <- multimodal_m2_ablation(
#   sim,
#   chains = 4,
#   parallel_chains = 4,
#   iter_warmup = 1000,
#   iter_sampling = 1000,
#   seed = 221
# )
# 
# info <- multimodal_m2_process_information(abl)
# info
# 
# plot(info, type = "response_elpd")
# plot(info, type = "theta_variance")

