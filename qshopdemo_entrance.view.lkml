view: qshopdemo_entrance {

  # Qubit LookML | Retail | V2
  sql_table_name:  `qubit-client-37403.qshopdemo__v2.livetap_entrance` ;;

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: context_entrance_number {
    type: number
    sql: ${TABLE}.context_entranceNumber ;;
    label: "Entrance Number"
    description: "Entrance number of the visitor, in a lifetime. QP fields: context_entranceNumber"
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor ID"
    description: "ID unique to the visitor. QP fields: context_id"
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    label: "Session Number"
    hidden: yes
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    label: "Entrance ID"
    hidden: yes
  }

  dimension_group: time_data_points {
    label: ""
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "⏰ Date & Time"
    description: "Timestamp of an entrance. QP field: meta_serverTs (with applied UTC offset for your timezone)"
  }

  dimension: meta_url {
    type: string
    sql: ${TABLE}.meta_url ;;
    hidden: yes
  }

  dimension: referrer_keywords {
    type: string
    sql: ${TABLE}.referrer_keywords ;;
    hidden: yes
    group_label: "Referrer"
    label: "Keywords"
    description: "Referrer Keywords - as emitted. QP fields: referrer_keywords"
  }

  dimension: referrer_label {
    type: string
    sql: ${TABLE}.referrer_label ;;
    group_label: "Referrer"
    label: "Label"
    description: "Label carried by the referrer - as emitted. QP fields: referrer_label"
  }

  dimension: referrer_network {
    type: string
    sql: ${TABLE}.referrer_network ;;
    group_label: "Referrer"
    label: "Network"
    description: "network of the referrer - as emitted, usually populated for affiliates. QP fields: referrer_network"
  }

  dimension: referrer_type {
    type: string
    sql: ${TABLE}.referrer_type ;;
    group_label: "Referrer"
    label: "Type"
    description: "Entrance referrer type, e.g. DIRECT, EMAIL, SEO. QP fields: referrer_type"
  }

  dimension: referrer_url {
    type: string
    sql: ${TABLE}.referrer_url ;;
    group_label: "Referrer"
    label: "URL"
    description: "URL of referrer. QP fields: referrer_url"
  }

  dimension: source {
    type: string
    sql: ${TABLE}.utm_source ;;
    group_label: "UTM"
    label: "Source"
    description: "Google's utm_source parameter extracted out of the referrer URL. QP fields: referrer_url"
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
    group_label: "UTM"
    label: "Medium"
    description: "Google's utm_medium parameter extracted out of the referrer URL. QP fields: referrer_url"
  }

  dimension: content {
    type: string
    sql: ${TABLE}.utm_content ;;
    group_label: "UTM"
    label: "Content"
    description: "Google's utm_content parameter extracted out of the referrer URL. QP fields: referrer_url"
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
    group_label: "UTM"
    label: "Campaign"
    description: "Google's utm_campaign parameter extracted out of the referrer URL. QP fields: referrer_url"
  }

  dimension: term {
    type: string
    sql: ${TABLE}.utm_term ;;
    group_label: "UTM"
    label: "Term"
    description: "Google's utm_term parameter extracted out of the referrer URL. QP fields: referrer_url"
  }

  measure: entrance_visitors {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id) ;;
    description: "Count of unique visitor_ids.  QP fields: context_id"
  }

  measure: entrances {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.entrance_id) ;;
    description: "Count of unique combinations of a visitor_id and an entrance_number.  QP fields: context_id, context_entranceNumber"
  }
}
