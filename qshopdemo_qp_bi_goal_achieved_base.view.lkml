#File uploaded: Mon Apr 09 11:03:11 GMT 2018
view: qshopdemo_qp_bi_goal_achieved_base {

 #version 1.1
 sql_table_name:  [qubit-client-37403:qshopdemo.qp_bi_goal_achieved] ;;

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    primary_key: yes
    description: "View number of the visitor, in a lifetime (only if any goal was achieved on this view or afterwards, for a certain visitor). QP fields: context_id, context_viewNumber"
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor ID"
    description: "ID unique to the visitor. QP fields: context_id"
  }


  dimension: context_view_number {
    type: number
    sql: ${TABLE}.context_viewNumber ;;
    label: "View Number"
    hidden: yes
  }

  dimension: is_post_goal_achieved_view {
    type: yesno
    sql: ${TABLE}.is_post_goal_achieved_view = 1 ;;
    label: "Include Post Goal Achieved Views?"
    description: "Set to 'No' if you do NOT require post-goal achieved analysis. Flag allows to filter views: 'yes' if you only need views that happened after user achieved a goal, 'no' if you only need views on which user achieved a goal. QP fields: derived"
  }

  dimension: experience_id {
    type: string
    sql: STRING(${TABLE}.experienceId) ;;
    group_label: "Experience"
    description: "ID unique to the experience which the goal refers to. QP fields: experienceId"

  }

  dimension: experience_name {
    type: string
    sql: ${TABLE}.experienceName ;;
    group_label: "Experience"
    description: "The name of experience which the goal refers to. QP fields: experienceName"
  }

  dimension: goal_id {
    type: string
    sql: STRING(${TABLE}.goalId);;
    group_label: "Goal Achieved"
    description: "ID unique to the goal. QP fields: goalId"
  }

  dimension: goal_value {
    type: string
    sql: ${TABLE}.goalValue ;;
    group_label: "Goal Achieved"
    description: "Goal name. QP fields: goalValue"
  }
  
  dimension: goal_type {
    type: string
    sql: ${TABLE}.goalType ;;
    group_label: "Goal Achieved"
    description: "Goal type as specified for a given experience. QP fields: goalType"
  }


  dimension: is_control {
    type: yesno
    sql: ${TABLE}.isControl = 1;;
    group_label: "Experience"
    description: "Returns 'Yes' if the visitor is in conrtol group of experiment (on a view), otherwise returns 'No'. QP fields: isControl"
  }

  dimension: iteration_id {
    type: string
    sql: STRING(${TABLE}.iterationId) ;;
    group_label: "Experience"
    description: "The unique ID of the experience variation shown. QP fields: iterationId"
  }


  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    label: "Record Received Date"
    description: "Date for ts (in the timezone configured for the tracking ID, format yyyy-MM-dd). QP fields: meta_recordDate"
  }

  dimension_group: time_data_points {
    label: "Time Data Points"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "Time Data Points"
    description: "Timestamp of achieving the goal by the visitor. QP fields:  meta_serverTs (with applied UTC offset, also accounting for daylight saving time)"
  }

  dimension: variation_master_id {
    type: string
    sql: STRING( ${TABLE}.variationMasterId) ;;
    group_label: "Experience"
    description: "Master variation ID of an experiment. The ID is assigned when a variation is launched and it is preserved throughout the experiment. QP fields: variationMasterId"
  }

  dimension: variation_name {
    type: string
    sql: ${TABLE}.variationName ;;
    group_label: "Experience"
    description: "The name assigned to variation master ID. QP fields: variationName"
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

  dimension: days_experience_live_on_visitors_view {
    type: number
    sql: ${TABLE}.days_experience_live ;;
    group_label: "Experience"
    description: "The number of days the experience had been live at the time of user's pageview"
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
    sql: ${TABLE}.experience_paused_on_view = 1;;
    group_label: "Experience"
    description: "True if experience was paused at the time of the view. NB. An experience will be visible in user's activity for up to 15 days from the time it was paused. After the cut-off period, the paused experience will no longer be included in visitor's activity"
  }

  measure: goal_achieved_visitors {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.goalId IS NOT NULL,${TABLE}.context_id,NULL), 1000000)  ;;
    description: "Count of unique visitor_ids. If above 1.000.000, the result is approximated. Only for views on which a goal was achieved or views that happened after a goal was achieved. QP fields: context_id, goalId"
  }

  measure: distinct_goals {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.goalId, 1000000) ;;
    description: "Count of unique goal_ids. Only for views on which a goal was achieved or views that happened after a goal was achieved. QP fields: goalId"
  }

  measure: goal_achieved_views {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.goalId IS NOT NULL,${TABLE}.view_id,NULL), 1000000)  ;;
    description: "Count of unique views. If above 1.000.000, the result is approximated. Only for views on which a goal was achieved or views that happened after a goal was achieved. QP fields: context_id, context_viewNumber, goalId"

  }
 
  measure: primary_goal_converters {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.goalType = 'primaryConversion', ${TABLE}.context_id,NULL), 1000000)  ;;
  }

  measure: custom_goal_converters {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.goalType = 'other', ${TABLE}.context_id,NULL), 1000000)  ;;
  }

#  measure: latest_traffic_allocation {
#    type: number
#    sql: MAX(${TABLE}.trafficAllocation) ;;
#  }

 #  measure: days_experience_live {
 #    type: number
 #    sql:   MAX(IF(${TABLE}.experience_last_paused_at = '2030-01-01', DATEDIFF(CURRENT_DATE(), ${TABLE}.experience_first_published_at), DATEDIFF(${TABLE}.experience_last_paused_at, ${TABLE}.experience_first_published_at)));;
 #    group_label: "Experience"
 #    description: "The number of days the experience has been live as of today"
 #  }

 measure: days_experience_live {
   type: number
   sql:   COUNT(DISTINCT IF(${TABLE}.experience_status  = 'Live' AND ${TABLE}.meta_recordDate >= ${TABLE}.experience_first_published_at, ${TABLE}.meta_recordDate, NULL) ) ;;
   group_label: "Experience"
   description: "The number of days the experience has been live as of today"
 }

}
