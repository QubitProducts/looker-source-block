include:    "q_*.view"

include: "model.model.lkml"
persist_for: "24 hours"
case_sensitive: no

explore: q_analytics {
  extends: [q_view]

  always_filter: {
    filters: {
      field: site
      value: ".com"
    }
    filters: {
      field: time_data_points_date
      value: "last 7 days"
    }
  }

  # add lookml model customizations here
}
