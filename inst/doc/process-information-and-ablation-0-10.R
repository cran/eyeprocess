## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
set.seed(10)
base <- matrix(rnorm(6000, sd=1), ncol=3)
aug  <- matrix(rnorm(6000, sd=.8), ncol=3)
colnames(base) <- colnames(aug) <- c("A","B","C")
info <- process_information(base, aug, metric="entropy_reduction")
info
plot(info)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_irt(n_person=50,n_item=8,seed=5)
abl <- ablate_multimodal_channels(sim$measurement)
names(abl$scenarios)

