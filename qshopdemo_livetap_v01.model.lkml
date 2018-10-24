include:    "qshopdemo_*.view"

include: "qshopdemo_livetap.model.lkml"
persist_for: "24 hours"
case_sensitive: no

explore: qshopdemo_analytics {
  extends: [qshopdemo_view]

  # add lookml model customizations here
}
