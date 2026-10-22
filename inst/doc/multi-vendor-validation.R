## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# corpus <- validate_eye_corpus("C:/private/eyeprocess-validation-corpus")
# audit <- audit_vendor_validation(
#   corpus,
#   vendor_validation_spec(
#     required_vendors = c("gazepoint", "tobii", "pupillabs", "eyelink", "smi"),
#     min_cases_per_vendor = 2,
#     min_pass_rate = 0.95,
#     require_licence_reviewed = TRUE
#   )
# )
# print(audit)
# plot(audit)
# write_vendor_validation_report(audit, "validation/vendor-validation.md")

