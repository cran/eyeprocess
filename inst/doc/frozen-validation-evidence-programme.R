## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
plan <- eyeprocess_validation_plan(
  sample_size = c(250L, 750L), n_items = c(12L, 24L),
  missing_rate = c(0, .15), specification = c("correct", "misspecified"),
  replications = 20L, seed = 20260811L
)
head(expand_eyeprocess_validation_plan(plan))

## -----------------------------------------------------------------------------
rules <- list(
  rmse = validation_acceptance_rule("rmse", "max", .20),
  failure = validation_acceptance_rule("failure_rate", "max", .05)
)

## ----m2-visual-validation-freeze, fig.width=7, fig.height=4.5, fig.align='center', fig.cap='Illustrative frozen validation-evidence object.'----
viz_claim <- eyeprocess::eyeprocess_validation_claim_matrix(
  'C1',
  'software behaviour is reproducible',
  'E1',
  'test',
  'supported'
)

viz_freeze <- eyeprocess::freeze_eyeprocess_validation_evidence(
  design = data.frame(id = 1),
  recovery = data.frame(x = 1),
  stress = data.frame(x = 1),
  reliability = data.frame(x = 1),
  negative_controls = data.frame(x = 1),
  claims = viz_claim,
  provenance = list(commit = 'documentation-example'),
  source_commit = 'documentation-example'
)

stopifnot(
  eyeprocess::verify_eyeprocess_validation_evidence(
    viz_freeze
  )
)

plot(viz_freeze)

