## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# spec <- eye_analysis_spec(blink_correction="linear", pupil_baseline=c(-500,0), fixation_algorithm="ivt", aoi_rule="probabilistic")
# p <- eye_analysis_pipeline(list(
#   eye_pipeline_step("import", read_fun),
#   eye_pipeline_step("quality", quality_fun, requires="import"),
#   eye_pipeline_step("model", model_fun, requires="quality")
# ), spec = spec)
# validate_eye_pipeline(p)
# r <- run_eye_pipeline(p, context=list(path="study.csv"))
# audit_eye_pipeline(r)
# plot(p)

