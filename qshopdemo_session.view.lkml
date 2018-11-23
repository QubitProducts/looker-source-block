view: qshopdemo_session {

  # Qubit LookML | Retail | V2
  derived_table: {
    sql:
      SELECT
        *
      FROM
        `qubit-client-37403.{{realtime.site._parameter_value}}__v2.livetap_session`
      WHERE
        {% condition qshopdemo_analytics.time_data_points_date  %} property_event_ts {% endcondition %}
      ;;
  }
 
  view_label: "Sessions"
  dimension: app_name {
    type: string
    sql: ${TABLE}.appName ;;
    group_label: "Browser"
    label: "Name"
    description: "Browser name of the IP address associated with a certain session, e.g. 'Chrome'. QP fields: appName"
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: app_type {
    type: string
    sql: ${TABLE}.appType ;;
    group_label: "Browser"
    label: "Type"
    description: "Browser type of the IP address associated with a certain session, e.g. 'browser'. QP fields: appType"
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.appVersion ;;
    group_label: "Browser"
    label: "Version"
    description: "Browser version of the IP address associated with a certain session, e.g. '51.0.2704.81'. QP fields: appVersion"
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
    description: "Session number of the visitor, in a lifetime. QP fields: ipLocation_region"
  }

  dimension: device_name {
    type: string
    sql: ${TABLE}.deviceName ;;
    group_label: "Device"
    label: "Name"
    description: "The device name, currently only available in mobile devices' user agent strings. QP fields: deviceName"
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.deviceType ;;
    group_label: "Device"
    label: "Type"
    description: "The device type. Can be mobile, tablet, pc, console or other. QP fields: deviceType"
  }

  dimension: ip_location_area {
    type: string
    sql: ${TABLE}.ipLocation_area ;;
    group_label: "Location"
    label: "Area"
    description: "Name of geographical area, of the IP address associated with a certain session, e.g. 'itv london'. QP fields: ipLocation_area"
  }

  dimension: ip_location_city {
    type: string
    sql: ${TABLE}.ipLocation_city ;;
    group_label: "Location"
    label: "City"
    description: "Name of city of the IP address associated with a certain session, e.g. 'weybridge' . QP fields: ipLocation_city"
  }

  dimension: ip_location_country {
    type: string
    sql: ${TABLE}.ipLocation_country ;;
    group_label: "Location"
    label: "Country"
    description: "Name of country of the IP address associated with a certain session, e.g. 'united kingdom'. QP fields: ipLocation_country"
  }

  dimension: ip_location_country_code {
    type: string
    sql: ${TABLE}.ipLocation_country_code ;;
    group_label: "Location"
    label: "Country Code"
    map_layer_name: countries
    description: "Country code of the IP address associated with a certain session, e.g. 'GB'. This field should be used in Looker to creatre any geographical map visualizations . QP fields: ipLocation_country_code"
  }

  dimension: ip_location_region {
    type: string
    sql: ${TABLE}.ipLocation_region ;;
    group_label: "Location"
    label: "Region"
    description: "Name of region of the IP address associated with a certain session, e.g. 'surrey' . QP fields: ipLocation_region"
  }

  dimension_group: time_data_points {
    label: ""
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "⏰ Date & Time"
    description: "Timestamp of the start of the session. QP fields:  meta_serverTs (with applied UTC offset, for your timezone)"
    hidden: yes
  }

  dimension: meta_url {
    type: string
    sql: ${TABLE}.meta_url ;;
    hidden: yes
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.osName ;;
    group_label: "OS"
    label: "Name"
    description: "The OS name of the device. Can be IOS, MacOS, Windows, Android or Linux. QP fields: osName"
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.osVersion ;;
    group_label: "OS"
    label: "Version"
    description: "The OS version of device e.g. for MacOS Yosemite it could be 10.10.1, for IOS8 it could be 8.1.1. QP fields: osVersion"
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  measure: session_visitors {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id) ;;
    description: "Count of unique visitor_ids.  QP fields: context_id"
  }

  measure: sessions {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.session_id) ;;
    description: "Count of unique combinations of a visitor_id and an session_number.  QP fields: context_id, context_sessionNumber"
  }
}
