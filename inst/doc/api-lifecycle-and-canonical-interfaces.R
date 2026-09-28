## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# inv <- eye_api_inventory()
# reg <- eye_api_lifecycle()
# reg <- register_eye_api_status(reg, "run_eye_pipeline", "workflow", canonical="run_eye_pipeline")
# audit <- audit_eye_api(inv, reg)
# api_surface_summary(audit$table)
# eye_api_recommendation(audit)

## ----lifecycle-closure--------------------------------------------------------
lifecycle <- eyeprocess::eye_api_lifecycle()
inventory <- eyeprocess::eye_api_inventory()
audit <- eyeprocess::audit_eye_api(inventory, lifecycle)

eyeprocess::api_surface_summary(inventory)
audit

