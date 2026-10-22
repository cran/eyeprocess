## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## ----profiles-----------------------------------------------------------------
head(eye_format_profiles())

## ----single-source------------------------------------------------------------
path <- system.file("extdata", "gazepoint", "demo-user.csv", package = "eyeprocess")

result <- validate_eye_source(
  path,
  vendor = "gazepoint",
  spec = format_validation_spec(run_roundtrip = TRUE),
  import_args = list(recording_id = "R001", quiet = TRUE),
  retain_dataset = TRUE,
  case_id = "gazepoint-demo"
)

summary(result)
result$checks

## ----initialize-corpus, eval=FALSE--------------------------------------------
# init_validation_corpus("C:/private/eyeprocess-validation-corpus")

## ----manifest-----------------------------------------------------------------
manifest <- validation_manifest(
  paths = c(
    system.file("extdata", "gazepoint", "demo-user.csv", package = "eyeprocess"),
    system.file("extdata", "tobii-demo.tsv", package = "eyeprocess")
  ),
  vendor = c("gazepoint", "tobii"),
  format_family = c("gazepoint_analysis", "tobii_pro_lab"),
  software_version = c("fixture", "fixture"),
  case_id = c("gp-fixture", "tobii-fixture")
)

corpus <- validate_eye_corpus(
  manifest,
  spec = format_validation_spec(run_roundtrip = FALSE),
  import_args = list(
    `gp-fixture` = list(recording_id = "R001", quiet = TRUE),
    `tobii-fixture` = list(recording_id = "R002", quiet = TRUE)
  )
)

corpus$summary

## ----compatibility------------------------------------------------------------
format_compatibility_matrix(corpus)[, c(
  "format_id", "adapter", "validation_level",
  "empirical_cases", "empirical_passes", "empirical_failures"
)]

## ----bundle, eval=FALSE-------------------------------------------------------
# create_validation_bundle(
#   result,
#   path = "gazepoint-validation-bundle.zip",
#   include_dataset = TRUE,
#   anonymize = TRUE,
#   overwrite = TRUE
# )

