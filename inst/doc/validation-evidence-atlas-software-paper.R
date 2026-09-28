## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
claims <- eyeprocess_validation_claim_matrix(
  c("C1","C2"),
  c("Scenario expansion is deterministic", "Exact engines are not silently substituted"),
  c("E1","E2"), c("test","engine-contract"), c("supported","qualified")
)
atlas <- eyeprocess_validation_evidence_atlas(claims, recovery = data.frame(id="demo"))
atlas

## ----m2-visual-atlas, fig.width=7, fig.height=4.5, fig.align='center', fig.cap='Illustrative validation-evidence atlas linking a declared software claim to recorded evidence.'----
viz_claims <- eyeprocess::eyeprocess_validation_claim_matrix(
  'C1',
  'software behaviour is reproducible',
  'E1',
  'test',
  'supported'
)

viz_atlas <- eyeprocess::eyeprocess_validation_evidence_atlas(
  viz_claims,
  recovery = data.frame(x = 1)
)

stopifnot(
  inherits(viz_atlas, 'eye_validation_evidence_atlas')
)

plot(viz_atlas)

## ----m2-visual-atlas-freeze, fig.width=7, fig.height=4.5, fig.align='center', fig.cap='Frozen form of the illustrative validation-evidence atlas.'----
viz_atlas_freeze <- eyeprocess::freeze_eyeprocess_validation_atlas(
  viz_atlas
)

stopifnot(
  eyeprocess::verify_eyeprocess_validation_atlas(
    viz_atlas_freeze
  )
)

plot(viz_atlas_freeze)

