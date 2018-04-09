#File uploaded: Mon Apr 09 11:03:11 GMT 2018
connection: "qubit-client-37403"
include: "qshopdemo_qp_bi*.view"
include: "qshopdemo_livetap_base.model.lkml"
include: "qshopdemo_[!recs]*.dashboard"

persist_for: "24 hours"
case_sensitive: no

explore: qshopdemo_qp_bi_attribution_v01 {
  extends: [qshopdemo_qp_bi_attribution_base]

  # add lookml model customizations here
}

explore: qshopdemo_qp_bi_view_v01 {
  extends: [qshopdemo_qp_bi_view_base]

  # add lookml model customizations here
}


explore: qshopdemo_qp_bi_visitor_pulse_v01 {
  extends: [qshopdemo_qp_bi_visitor_pulse_base]

  # add lookml model customizations here
}


explore: qshopdemo_qp_bi_product_v01 {
  extends: [qshopdemo_qp_bi_product_base]

  # add lookml model customizations here
}


explore: qshopdemo_qp_bi_experience_v01 {
  extends: [qshopdemo_qp_bi_experience_base]

  # add lookml model customizations here
}
