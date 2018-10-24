connection: "qubit-livetap"
include:    "qshopdemo_*.view"
persist_for: "24 hours"
case_sensitive:  no

explore: qshopdemo_view {
  group_label: "Qubit Live Tap"
  extension: required
  fields: [ALL_FIELDS*, -qshopdemo_attribution_v01.first_click_value, -qshopdemo_attribution_v01.last_click_value, -qshopdemo_attribution_v01.even_click_value, -qshopdemo_attribution_v01.behavioural_value]
  view_name: qshopdemo_view_v01
  from: qshopdemo_view_v01
  label: "Analytics: qshopdemo"
  view_label: "Views"
  persist_for: "24 hours"

  join:  qshopdemo_session_v01 {
    view_label: "Sessions"
    relationship: many_to_one
    sql_on: ${qshopdemo_session_v01.session_id} = ${qshopdemo_view_v01.session_id} ;;
  }

  join:  qshopdemo_entrance_v01 {
    view_label: "Entrances"
    relationship: many_to_one
    sql_on: ${qshopdemo_entrance_v01.entrance_id} = ${qshopdemo_view_v01.entrance_id} ;;
  }

  join: qshopdemo_transaction_v01 {
    view_label: "Transactions"
    foreign_key:qshopdemo_view_v01.view_id
    relationship:  one_to_one
  }

  join: qshopdemo_product_v01 {
    view_label: "Product Interaction and Sales"
    relationship: one_to_many
    sql_on: ${qshopdemo_product_v01.view_id} = ${qshopdemo_view_v01.view_id} ;;
  }

  join: qshopdemo_segment_v01 {
    view_label: "Segment Membership"
    foreign_key:qshopdemo_view_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_experience_v01 {
    view_label: "Experiences"
    foreign_key:qshopdemo_view_v01.view_id
    relationship: one_to_many
  }

  join:  qshopdemo_experience_meta_data_v01 {
    relationship: many_to_one
    sql_on: qshopdemo_experience_v01.experienceId = qshopdemo_experience_meta_data_v01.experienceId ;;
  }

  join: qshopdemo_goal_achieved_v01 {
    view_label: "Goal Achieved"
    foreign_key:qshopdemo_view_v01.view_id
    relationship: one_to_many
  }

  join:  qshopdemo_goal_achieved_meta_data_v01 {
    relationship: many_to_one
    sql_on: qshopdemo_goal_achieved_v01.experienceId = qshopdemo_goal_achieved_meta_data_v01.experienceId ;;
  }

  join: qshopdemo_attribution_v01 {
    view_label: "Attribution"
    relationship: many_to_one
    sql_on: (qshopdemo_attribution_v01.context_id = qshopdemo_view_v01.context_id
              AND qshopdemo_attribution_v01.context_sessionNumber = qshopdemo_view_v01.context_sessionNumber
              AND qshopdemo_attribution_v01.context_entranceNumber = qshopdemo_view_v01.context_entranceNumber
              AND qshopdemo_attribution_v01.context_conversionNumber = qshopdemo_view_v01.context_conversionNumber
              ) ;;
  }

  join: qshopdemo_visitor_pulse_v01 {
    view_label: "Visitor Pulse"
    foreign_key:qshopdemo_view_v01.view_id
    relationship: one_to_many
  }

    join: qshopdemo_user_action_v01 {
    view_label: "User Action"
    foreign_key: qshopdemo_view_v01.view_id
    relationship: one_to_many
  }
}


explore: qshopdemo_attribution {
  fields: [ALL_FIELDS*, -qshopdemo_attribution_v01.first_click_value_livetap, -qshopdemo_attribution_v01.last_click_value_livetap, -qshopdemo_attribution_v01.even_click_value_livetap, -qshopdemo_attribution_v01.behavioural_value_livetap]
  extension: required
  view_name: qshopdemo_attribution_v01
  from: qshopdemo_attribution_v01
  hidden: yes
  persist_for: "24 hours"
}


explore: qshopdemo_visitor_pulse {
  extension: required
  from: qshopdemo_visitor_pulse_v01
  label: "Visitor Pulse Data - qshopdemo"
  view_label: "Visitor Pulse"
  persist_for: "24 hours"
  hidden: yes
  view_name: qshopdemo_visitor_pulse_v01

  join:  qshopdemo_session_v01 {
    view_label: "Sessions"
    relationship: many_to_one
    sql_on: ${qshopdemo_session_v01.session_id} = ${qshopdemo_visitor_pulse_v01.session_id} ;;

  }

  join:  qshopdemo_view_v01 {
    view_label: "Views"
    relationship: many_to_one
    sql_on: ${qshopdemo_view_v01.view_id} = ${qshopdemo_visitor_pulse_v01.view_id} ;;

  }

  join:  qshopdemo_entrance_v01 {
    view_label: "Entrances"
    relationship: many_to_one
    sql_on: ${qshopdemo_entrance_v01.entrance_id} = ${qshopdemo_visitor_pulse_v01.entrance_id} ;;
  }

  join: qshopdemo_transaction_v01 {
    view_label: "Transactions"
    foreign_key:qshopdemo_visitor_pulse_v01.view_id
    relationship:  one_to_one
  }

  join: qshopdemo_segment_v01 {
    view_label: "Segment Membership"
    foreign_key:qshopdemo_visitor_pulse_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_experience_v01 {
    view_label: "Experiences"
    foreign_key:qshopdemo_visitor_pulse_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_goal_achieved_v01 {
    view_label: "Goal Achieved"
    foreign_key:qshopdemo_visitor_pulse_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_user_action_v01 {
    view_label: "User Action"
    relationship: many_to_one
    sql_on: (qshopdemo_user_action_v01.view_id = qshopdemo_visitor_pulse_v01.view_id) ;;
  }
}

explore: qshopdemo_product {
  extension: required
  from: qshopdemo_product_v01
  label: "Product Data - qshopdemo"
  view_label: "Product"
  persist_for: "24 hours"
  hidden: yes
  view_name: qshopdemo_product_v01

  join:  qshopdemo_session_v01 {
    view_label: "Sessions"
    relationship: many_to_one
    sql_on: ${qshopdemo_session_v01.session_id} = ${qshopdemo_product_v01.session_id} ;;

  }

  join:  qshopdemo_view_v01 {
    view_label: "Views"
    relationship: many_to_one
    sql_on: ${qshopdemo_view_v01.view_id} = ${qshopdemo_product_v01.view_id} ;;

  }

  join:  qshopdemo_entrance_v01 {
    view_label: "Entrances"
    relationship: many_to_one
    sql_on: ${qshopdemo_entrance_v01.entrance_id} = ${qshopdemo_product_v01.entrance_id} ;;
  }

  join: qshopdemo_transaction_v01 {
    view_label: "Transactions"
    foreign_key:qshopdemo_product_v01.view_id
    relationship:  one_to_one
  }

  join: qshopdemo_segment_v01 {
    view_label: "Segment Membership"
    foreign_key:qshopdemo_product_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_experience_v01 {
    view_label: "Experiences"
    foreign_key:qshopdemo_product_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_goal_achieved_v01 {
    view_label: "Goal Achieved"
    foreign_key:qshopdemo_product_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_user_action_v01 {
    view_label: "User Action"
    relationship: many_to_one
    sql_on: (qshopdemo_product_v01.view_id = qshopdemo_user_action_v01.view_id) ;;
  }
}

explore: qshopdemo_experience {
  extension: required
  from: qshopdemo_experience_v01
  label: "Experience Data - qshopdemo"
  view_label: "Experience"
  persist_for: "24 hours"
  hidden: yes
  view_name: qshopdemo_experience_v01


  join:  qshopdemo_session_v01 {
    view_label: "Sessions"
    relationship: many_to_one
    sql_on: ${qshopdemo_session_v01.session_id} = ${qshopdemo_experience_v01.session_id} ;;

  }

  join:  qshopdemo_view_v01 {
    view_label: "Views"
    relationship: many_to_one
    sql_on: ${qshopdemo_view_v01.view_id} = ${qshopdemo_experience_v01.view_id} ;;

  }

  join:  qshopdemo_entrance_v01 {
    view_label: "Entrances"
    relationship: many_to_one
    sql_on: ${qshopdemo_entrance_v01.entrance_id} = ${qshopdemo_experience_v01.entrance_id} ;;
  }

  join: qshopdemo_transaction_v01 {
    view_label: "Transactions"
    foreign_key:qshopdemo_experience_v01.view_id
    relationship:  one_to_one
  }

  join: qshopdemo_segment_v01 {
    view_label: "Segment Membership"
    foreign_key:qshopdemo_experience_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_goal_achieved_v01 {
    view_label: "Goal Achieved"
    foreign_key:qshopdemo_experience_v01.view_id
    relationship: one_to_many
  }

  join: qshopdemo_user_action_v01 {
    view_label: "User Action"
    relationship: many_to_one
    sql_on: (qshopdemo_experience_v01.view_id = qshopdemo_user_action_v01.view_id) ;;
  }

  join:  qshopdemo_experience_meta_data_v01 {
    relationship: many_to_one
    sql_on: qshopdemo_experience_v01.experienceId = qshopdemo_experience_meta_data_v01.experienceId ;;

  }

  join:  qshopdemo_goal_achieved_meta_data_v01 {
    relationship: many_to_one
    sql_on: qshopdemo_goal_achieved_v01.experienceId = qshopdemo_goal_achieved_meta_data_v01.experienceId ;;
  }
}
