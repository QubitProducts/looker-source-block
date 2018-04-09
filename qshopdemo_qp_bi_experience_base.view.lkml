#File uploaded: Mon Apr 09 11:03:11 GMT 2018
view: qshopdemo_qp_bi_experience_base {

 #version 1.1
 sql_table_name:  [qubit-client-37403:qshopdemo.qp_bi_experience] ;;

#Time, visitor and meta info
  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    hidden:  yes
  }


  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor ID"
    description: "View number of the visitor, in lifetime. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_viewNumber"
  }

  dimension: is_post_experience_view {
    type: yesno
    sql: ${TABLE}.is_post_experience_view = 1 ;;
    label: "Include Post Experience Views?"
    description: "'Yes' flags all views that happened after the view on which an experience was seen, while 'No' flags all views on which a certain experience was seen. Default settign - 'yes'. Set to 'no' if you don't require post-experience analysis. QP fields: derived"
  }

  dimension: context_view_number {
    type: number
    sql: ${TABLE}.first_view_in_iteration ;;
    label: "View Number"
    description: "View number of the visitor, in lifetime. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_viewNumber"
  }

  dimension: last_view_in_iteration {
    type: number
    sql: ${TABLE}.last_view_in_iteration ;;
    hidden: yes
  }

  dimension: first_view_meta_ts {
    type: number
    sql: ${TABLE}.first_view_meta_ts ;;
    hidden: yes
  }

  dimension_group: time_data_points {
    label: "Time Data Points"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "Time Data Points"
    description: "Timestamp of all views that happened on or after seeing an experience. QP field: meta_serverTs (with applied UTC offset, also accounting for daylight saving time)"
  }

#Experience related dimensions
  dimension: experience_id {
    type: string
    sql: STRING(${TABLE}.experienceId) ;;
    group_label: "Experience"
    description: "ID unique to the experience. QP fields: experienceId"
  }

  dimension: experience_name {
    type: string
    sql: ${TABLE}.experienceName ;;
    group_label: "Experience"
    description: "The assigned name of experience. QP fields: experienceName"

  }

  dimension: iteration_id {
    type: string
    sql: STRING(${TABLE}.iterationId) ;;
    group_label: "Experience"
    description: "The unique ID of iteration. Updates when modification is made to a master variation. QP fields: iterationId"
  }

  dimension: variation_master_id {
    type: string
    sql: STRING(${TABLE}.variationMasterId) ;;
    group_label: "Experience"
    description: "Master variation ID of an experiment. The ID is assigned when a variation is launched and it is preserved throughout the experiment. QP fields: variationMasterId"
  }

  dimension: variation_name {
    type: string
    sql: ${TABLE}.variationName ;;
    group_label: "Experience"
    description: "A name given to a master variation ID. Best to use in combination with ID as some of them may not have assigned names. QP fields: variationName"
  }

  dimension: is_control {
    type: yesno
    sql: ${TABLE}.isControl = 1 ;;
    label: "Control"
    group_label: "Experience"
    description: "Returns Yes if the visitor is in contol group of experiment (on a page view), otherwise returns No. QP fields: isControl"
  }


  dimension: traffic_allocation {
    type: number
    sql: ${TABLE}.trafficAllocation ;;
    group_label: "Experience"
  }


  dimension: days_experience_live_on_visitors_view {
    type: number
    sql: ${TABLE}.days_experience_live ;;
    group_label: "Experience"
    description: "The number of days the experience had been live at the time of user's pageview"
  }


dimension: experience_status_as_of_date {
    type: string
    sql: CASE
     WHEN ${TABLE}.experience_paused_within_15_days = 1  THEN 'Paused for 15 days or less'
     WHEN ${TABLE}.experience_status         = 'Paused'  THEN 'Paused for more than 15 days'
     WHEN ${TABLE}.experience_status         = 'Live'    THEN 'Live'
     END
       ;;
    label: "Experience Status As Of Date "
    group_label: "Experience"
    description: "Status of the experience at the time of pageview"

}

dimension: experience_paused_15_days_window {
    type: yesno
    sql: ${TABLE}.experience_paused_within_15_days = 1 ;;
    label: "Experience Paused - 15-day window"
    group_label: "Experience"
    description: "True if view happened within 15 days of the date experience being paused "
    hidden: yes
}


dimension: iteration_published_at {
    type: date
    sql: TIMESTAMP(${TABLE}.iteration_published_at) ;;
    group_label: "Experience"
    description: "Date the iteration was published"
  }

  dimension: iteration_paused_at {
    type: date
    sql: TIMESTAMP(${TABLE}.iteration_paused_at) ;;
    group_label: "Experience"
    description: "Date the iteration was paused"
  }

 dimension: experience_paused_on_view {
    type: yesno
    sql: ${TABLE}.experience_paused_on_view = 1 ;;
    group_label: "Experience"
    description: "True if experience was paused at the time of the view. NB. An experience will be visible in user's activity for up to 15 days from the time it was paused. After the cut-off period, the paused experience will no longer be included in visitor's activity"
  }

#Measures

  measure: experience_visitors {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.experienceId IS NOT NULL,${TABLE}.context_id,NULL), 1000000)  ;;
    description: "Count of unique visitor_ids. If above 1.000.000, the result is approximated. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_id, experienceId"
  }

  measure: distinct_experiences {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.experienceId, 1000000) ;;
    description: "Count of unique experience_ids. If above 1.000.000, the result is approximated. QP fields: experienceId"
  }

  measure: visitor_conversion_rate {
    type: number
    sql: ${experience_converters} /  COUNT(DISTINCT ${TABLE}.context_id, 1000000) ;;
    value_format_name: percent_2
    description: "Share of unique visitors on views that are labeled with any non-null transaction_id in all visitors. For counting, when figures are above 1.000.000, the result is approximated. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_id, transaction_id"
  }

  measure: experience_views {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.view_id, 1000) ;;
    description: "Count of unique combinations of a visitor_id and a view_number. If above 1.000.000, the result is approximated. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_id, context_viewNumber"
  }

  measure: experience_converters {
    type: number
    sql: COUNT(DISTINCT IF(${qshopdemo_qp_bi_transaction_v01.transaction_id} IS NOT NULL,${TABLE}.context_id,NULL), 1000000) ;;
    description: "Count of unique visitor_ids on views that are labeled with any non-null transaction_id. If above 1.000.000, the result is approximated. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: context_id, transaction_id"
  }

  measure: transaction_total {
    type: sum_distinct
    sql_distinct_key: ${qshopdemo_qp_bi_transaction_v01.transaction_id} ;;
    sql: CASE WHEN ${TABLE}.experienceId IS NOT NULL THEN ${qshopdemo_qp_bi_transaction_v01.transaction_total} END ;;
    value_format_name: decimal_2
    description: "Sum of transaction_total. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: experienceId, basket_total_baseValue"
  }

  measure: transactions {
    type: number
    sql: EXACT_COUNT_DISTINCT(CASE WHEN ${TABLE}.experienceId IS NOT NULL THEN ${qshopdemo_qp_bi_transaction_v01.transaction_id} END) ;;
  description: "Count of unique transaction_ids (always exact count). Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: transaction_id, experienceId"
  }

  measure: revenue_per_visitor {
    type: number
    sql: ${qshopdemo_qp_bi_experience_v01.transaction_total} / ${qshopdemo_qp_bi_experience_v01.experience_visitors} ;;
    value_format_name: decimal_2
    description: "Sum of transaction_total divided by count of unique visitor_ids. If count of visitor_ids is above 1.000.000, the result is approximated. Only for views on which an experience was seen or views that happened after an experience was seen. QP fields: basket_total_baseValue, context_id, experienceId"
  }


  measure: latest_traffic_allocation {
    type: number
    sql: FLOAT(COALESCE(SUBSTR(MAX(CONCAT(IF(${TABLE}.trafficAllocation = 0, NULL, ${TABLE}.meta_recordDate), STRING(FLOAT(IF(${TABLE}.trafficAllocation = 0, NULL,${TABLE}.trafficAllocation))))),11),'0.00'));;
  }

# measure: days_experience_live_on_view {
#   type: number
#   sql:   MAX(IF(${TABLE}.experience_last_paused_at = '2030-01-01', DATEDIFF(CURRENT_DATE(), ${TABLE}.experience_first_published_at), DATEDIFF(${TABLE}.experience_last_paused_at, ${TABLE}.experience_first_published_at)));;
#   group_label: "Experience"
#   description: "The number of days the experience has been live as of today"
# }


 measure: days_experience_live {
   type: number
   sql:   COUNT(DISTINCT IF(${TABLE}.experience_status  = 'Live' AND ${TABLE}.meta_recordDate >= ${TABLE}.experience_first_published_at, ${TABLE}.meta_recordDate, NULL) ) ;;
   description: "The number of days the experience has been live as of today"
 }
}
