## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## ----export-bundle------------------------------------------------------------
# out_dir <- "workflow-output/aoi-reporting-bundle"
# dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
# 
# utils::write.csv(result$grid_result$audit,
#                  file.path(out_dir, "perturbation-audit.csv"), row.names = FALSE)
# utils::write.csv(result$stability$overall,
#                  file.path(out_dir, "assignment-stability.csv"), row.names = FALSE)
# utils::write.csv(result$assignment_table,
#                  file.path(out_dir, "assignment-table.csv"), row.names = FALSE)
# utils::write.csv(result$models,
#                  file.path(out_dir, "model-results.csv"), row.names = FALSE)
# utils::write.csv(
#   assess_aoi_inference_stability(result, term = "condition"),
#   file.path(out_dir, "inference-stability.csv"), row.names = FALSE
# )
# utils::write.csv(result$failures,
#                  file.path(out_dir, "failures.csv"), row.names = FALSE)
# writeLines(report_aoi_sensitivity(result), file.path(out_dir, "report.md"))

