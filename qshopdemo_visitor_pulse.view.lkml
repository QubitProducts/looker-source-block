view: qshopdemo_visitor_pulse {

 # Qubit LookML | Retail | V2
 sql_table_name:  `qubit-client-37403.qshopdemo__v2.livetap_visitor_pulse` ;;

  dimension: answer {
    type: string
    sql: ${TABLE}.answer ;;
    description: "Answer given by the visitor, appropriate for the question type and order. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text"
  }

  dimension: answer_nontextarea {
    type: string
    sql: CASE WHEN ${TABLE}.question_type != 'textarea' THEN ${TABLE}.answer ELSE NULL END ;;
    description: "Answer given by the visitor, appropriate for the question type and order, excluding textarea questions. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text"
  }

  dimension: answer_score {
    type: number
    sql: CASE WHEN ${TABLE}.question_type = 'score' THEN INTEGER(${TABLE}.answer) ELSE NULL END ;;
  }

  dimension: answer_radio_checkbox {
    type: string
    sql: CASE WHEN (${TABLE}.question_type = 'radio' OR ${TABLE}.question_type = 'checkbox') THEN ${TABLE}.answer ELSE NULL END ;;
  }

  dimension: answer_textarea {
    type: string
    sql: CASE WHEN ${TABLE}.question_type = 'textarea' THEN ${TABLE}.answer ELSE NULL END ;;
  }

  dimension: answer_input {
    type: string
    sql: CASE WHEN ${TABLE}.question_type = 'input' THEN ${TABLE}.answer ELSE NULL END ;;
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor"
    description: "ID unique to the visitor. Only for views on which a survey was submitted. QP fields: context_id"
  }

  dimension: context_view_number {
    type: number
    sql: ${TABLE}.context_viewNumber ;;
    label: "View Number"
    description: "View number of the visitor, in a lifetime. Only for views on which a survey was submitted. QP fields: context_viewNumber"
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    hidden: yes
  }

  dimension: meta_server_ts {
    type: number
    sql: ${TABLE}.meta_serverTs ;;
    hidden: yes

  }

  dimension: meta_tracking_id {
    type: string
    sql: ${TABLE}.meta_trackingId ;;
    hidden: yes
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    hidden: yes
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: page_subtype {
    type: string
    sql: ${TABLE}.page_subtype ;;
    label: "Subtype"
    group_label: "Page"
    description: "Page subtype. QP fields: subtypes"
  }

  dimension: page_type {
    type: string
    sql: ${TABLE}.page_type ;;
    label: "Type"
    group_label: "Page"
    description: "Can be either home, category, product, checkout, transaction, help, contact or other. QP fields: type"
  }

  dimension_group: time_data_points {
    label: ""
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "⏰ Date & Time"
    description: "Timestamp of the page view. QP fields:  meta_serverTs (with applied UTC offset, for your timezone)"
  }

  dimension: meta_url {
    type: string
    sql: ${TABLE}.meta_url ;;
    label: "URL"
    description: "URL address on which a survey was submitted. QP fields: meta_url"
  }

  dimension: question_freetext {
    type: string
    sql: ${TABLE}.question_freetext ;;
    group_label: "Question"
    description: "Additional freetext submitted by visitor (e.g. 'Other' free-form box to fill in). QP fields: question_type, value_boolean, choice_text, value_text"
  }

  dimension: question_order {
    type: number
    sql: ${TABLE}.question_order ;;
    group_label: "Question"
    description: "Question order aligned with the order of questions in the UI. QP fields: question_order"
  }

  dimension: question_id {
    type: number
    sql: ${TABLE}.question_id ;;
    group_label: "Question"
    description: "ID unique to the question within a survey. QP fields: question_id"
  }

  dimension: question_text {
    type: string
    sql: ${TABLE}.question_text ;;
    group_label: "Question"
    description: "The actual question text that appeared within survey. QP fields: question_text"
    link: {
      label: "{{ value }} - question deep dive"
      url: "/dashboards/qshopdemo_livetap::qshopdemo_visitor_pulse_{{ qshopdemo_visitor_pulse_v01.question_type._value }}_question?question_text=\"{{ value }}\"&survey={{ qshopdemo_visitor_pulse_v01.survey_id._value }}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension: question_text_score {
    type: string
    sql: CASE WHEN ${TABLE}.question_type = 'score' THEN ${TABLE}.question_text ELSE NULL END ;;
    group_label: "Score Question Text"
  }

  dimension: question_text_radio_checkbox {
    type: string
    sql: CASE WHEN (${TABLE}.question_type = 'radio' OR ${TABLE}.question_type = 'checkbox') THEN ${TABLE}.question_text ELSE NULL END ;;
    group_label: "Radio / Checkbox Question Text"
  }

  dimension: question_text_textarea {
    type: string
    sql: CASE WHEN ${TABLE}.question_type = 'textarea' THEN ${TABLE}.question_text ELSE NULL END ;;
    group_label: "Textarea Question Text"
  }

  dimension: question_text_nontextarea {
    type: string
    sql: CASE WHEN ${TABLE}.question_type != 'textarea' THEN ${TABLE}.question_text ELSE NULL END ;;
    group_label: "Question"
    description: "The actual question text that appeared within survey, excluding textarea question texts. QP fields: question_text"
  }

  dimension: question_type {
    type: string
    sql: ${TABLE}.question_type ;;
    group_label: "Question"
    description: "One of four possible types of question: checkbox, radio, textarea, score. QP fields: question_type"
  }

  dimension: survey_id {
    type: string
    sql: ${TABLE}.survey_id ;;
    description: "ID unique to the survey iteration. QP fields: survey_id"
  }

  dimension: survey_total_questions {
    type: string
    sql: ${TABLE}.survey_totalQuestions ;;
    description: "Total questions asked in a survey. QP fields: survey_totalQuestions"
  }

  dimension: user_survey_answer_1 {
    type: string
    sql: ${TABLE}.user_survey_answer_1 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 1. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_2 {
    type: string
    sql: ${TABLE}.user_survey_answer_2 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 2. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_20 {
    type: string
    sql: ${TABLE}.user_survey_answer_20 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 20. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_3 {
    type: string
    sql: ${TABLE}.user_survey_answer_3 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 3. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_4 {
    type: string
    sql: ${TABLE}.user_survey_answer_4 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 4. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_5 {
    type: string
    sql: ${TABLE}.user_survey_answer_5 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 5. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_6 {
    type: string
    sql: ${TABLE}.user_survey_answer_6 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 6. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_7 {
    type: string
    sql: ${TABLE}.user_survey_answer_7 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 7. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_8 {
    type: string
    sql: ${TABLE}.user_survey_answer_8 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 8. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_9 {
    type: string
    sql: ${TABLE}.user_survey_answer_9 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 9. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_10 {
    type: string
    sql: ${TABLE}.user_survey_answer_10 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 10. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_11 {
    type: string
    sql: ${TABLE}.user_survey_answer_11 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 11. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_12 {
    type: string
    sql: ${TABLE}.user_survey_answer_12 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 12. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_13 {
    type: string
    sql: ${TABLE}.user_survey_answer_13 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 13. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_14 {
    type: string
    sql: ${TABLE}.user_survey_answer_14 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 14. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_15 {
    type: string
    sql: ${TABLE}.user_survey_answer_15 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 15. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_16 {
    type: string
    sql: ${TABLE}.user_survey_answer_16 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 16. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_17 {
    type: string
    sql: ${TABLE}.user_survey_answer_17 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 17. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_18 {
    type: string
    sql: ${TABLE}.user_survey_answer_18 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 18. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_answer_19 {
    type: string
    sql: ${TABLE}.user_survey_answer_19 ;;
    group_label: "Filter by Answers to Other Questions"
    description: "Answer to question of question_order = 19. For filtering purposes. QP fields: question_type, value_integer, value_text, question_type, value_boolean, choice_text, context_id, context_viewNumber"
  }

  dimension: user_survey_response_id {
    type: string
    sql: ${TABLE}.user_survey_response_id ;;
    group_label: "Filter by Answers to Other Questions"
    description: "ID unique to survey response submitted by the visitor. QP fields: context_id, context_viewNumber"
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }

  measure: last_answer_date {
    type: date
    sql: MAX(${qshopdemo_visitor_pulse_v01.time_data_points_date}) ;;
  }

  measure: survey_visitors {
    type: count_distinct
    sql: ${TABLE}.context_id ;;
    description: "Count of unique visitor_ids. Only for views on which a survey was submitted. QP fields: context_id"
    }

  measure: surveys_count {
    type: number
    sql: COUNT(DISTINCT survey_id) ;;
    description: "Count of unique survey_ids (always exact count). QP fields: survey_id"
  }

  measure: total_answers {
    type: number
    sql: COUNT(DISTINCT unique_row_id) ;;
    description: "Count of unique answer IDs. If a survey contains 3 questions, the result for a single submission will be 3. If there are 3 submissions, 3 questions each, the result will be 9 etc.. QP fields: context_id, context_viewNumber, question_order, question_type, value_integer, value_text, question_type, value_boolean, choice_text"
  }

  measure: total_unanswered_questions {
    type: number
    sql: COUNT(DISTINCT IF(answer IS NULL, unique_row_id,NULL)) ;;
    description: "Count of unique answer IDs, only for unanswered questions. If a survey contains 3 questions, but one answer was left blank, the result for a single submission will be 1. QP fields: context_id, context_viewNumber, question_order, question_type, value_integer, value_text, question_type, value_boolean, choice_text"
  }

  measure: total_answered_questions {
    type: number
    sql: COUNT(DISTINCT IF(answer IS NOT NULL, unique_row_id,NULL)) ;;
    description: "Count of unique answer IDs, only for answered questions. If a survey contains 3 questions, but one answer was left blank, the result for a single submission will be 2. QP fields: context_id, context_viewNumber, question_order, question_type, value_integer, value_text, question_type, value_boolean, choice_text"
  }

  measure: average_score {
    type: average_distinct
    sql: CASE WHEN ${TABLE}.question_type = 'score' THEN CAST(${TABLE}.answer AS INT64) ELSE NULL END ;;
    sql_distinct_key: ${TABLE}.view_id ;;
    value_format_name: "decimal_2"
    description: ""
  }

  measure: nps {
    type: number
    sql: (COUNT(DISTINCT CASE WHEN question_type = 'score' AND INTEGER(answer) >= 9 THEN unique_row_id ELSE NULL END) /
         COUT(DISTINCT CASE WHEN  question_type = 'score' THEN unique_row_id ELSE NULL END)) -
         COUNT(DISTINCT CASE WHEN  question_type = 'score' AND INTEGER(answer) <= 6 THEN unique_row_id ELSE NULL END) /
         COUNT(DISTINCT CASE WHEN  question_type = 'score' THEN unique_row_id ELSE NULL END) ;;
    value_format_name: "percent_2"
    label: "NPS"
  }
}
