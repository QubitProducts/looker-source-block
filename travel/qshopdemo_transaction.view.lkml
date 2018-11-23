view: qshopdemo_transaction {

  # Qubit LookML | Travel | V2
  derived_table: {
    sql:
      SELECT
        *
      FROM
        `qubit-client-37403.{{qshopdemo_view_v01.site._parameter_value}}__v2.livetap_transaction`
      WHERE
        {% condition qshopdemo_view_v01.time_data_points_date  %} property_event_ts {% endcondition %}
      ;;
  }

  dimension: new_vs_returning_purchaser {
    type: string
    sql: IF(${TABLE}.transaction_id IS NOT NULL, IF(${TABLE}.context_conversionNumber > 0, "returning", "new" ), NULL) ;;
    label: "New Vs Returning Purchased Status"
    description: "Returns 'new' if this is the first purchase of the visitor, otherwise 'returning'. QP fields: transaction_id, context_conversionNumber"
  }

  dimension: context_entrance_number {
    type: number
    sql: ${TABLE}.context_entranceNumber ;;
    label: "Entrance Number"
    description: "Entrance number of the visitor, in a lifetime. Only for entrances during which a transaction was made. QP fields: context_entranceNumber"
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor ID"
    description: "ID unique to the visitor (only for page views that are labeled with any non-null transaction_id). QP fields: context_id"
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    label: "Session Number"
    description: "Session number of the visitor, in a lifetime. Only for sessions during which a transaction was made. QP fields: context_sessionNumber"
  }

  dimension: transaction_total {
    type: string
    sql: ${TABLE}.transaction_total ;;
    hidden: yes
  }

  dimension: weeks_since_first_entry {
    type: number
    sql: DATE_DIFF(CAST(${TABLE}.property_event_ts AS DATE), CAST(TIMESTAMP(${qshopdemo_view_v01.visitor_first_entry_date}) AS DATE),WEEK);;
    label: "Weeks Since First Entry"
    group_label: "Time Since First Entry"
    value_format_name: decimal_0
    description: "Number of weeks between the first view of a visitor and a certain transaction. QP fields: meta_serverTs, meta_recordDate"
  }

  dimension: days_since_first_entry {
    type: number
    sql: DATE_DIFF(CAST(${TABLE}.property_event_ts AS DATE), CAST(TIMESTAMP(${qshopdemo_view_v01.visitor_first_entry_date}) AS DATE),DAY) ;;
    label: "Days Since First Entry"
    group_label: "Time Since First Entry"
    value_format_name: decimal_0
    description: "Number of days between the first view of a visitor and a certain transaction. QP fields: meta_serverTs, meta_recordDate"
  }

  dimension_group: time_data_points {
    label: ""
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "⏰ Date & Time"
    description: "Timestamp of the transaction. QP fields:  meta_serverTs (with applied UTC offset, for your timezone)"
    hidden: yes
  }
  
  dimension_group: time_data_points_previous_transaction {
    label: "Previous Transaction"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql: ${TABLE}.previous_transaction_ts ;;
    group_label: "Date & Time - Previous Transaction"
    description: "Timestamp of the previous transaction of the visitor. QP fields: meta_server_ts"
  }

  dimension: discount_applied {
    type: yesno
    sql: ${TABLE}.transaction_id IS NOT NULL AND ${TABLE}.package_discount_baseValue IS NOT NULL ;;
    description: "Returns 'yes' if total transaction value was discounted, 'no' otherwise. QP fields: transaction_id, package_discount_baseValue"
  }

  dimension: context_view_number {
    type: number
    sql: ${TABLE}.context_viewNumber ;;
    label: "View Number"
    description: "View number of the visitor, in a lifetime. Only for views on which a transaction was made. QP fields: context_viewNumber"
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    hidden: yes
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    hidden: yes
  }

  dimension: tracking_id {
    type: string
    sql: ${TABLE}.meta_trackingId ;;
    hidden: yes
  }

  dimension: meta_ts {
    type: number
    sql: ${TABLE}.meta_ts ;;
    hidden: yes
  }

  dimension: package_board_basis {
    type: string
    sql: ${TABLE}.package_boardBasis ;;
    group_label: "Package Info"
    description: "Board basis associated with the accommodation, e.g. All Inclusive, Continental Breakfast, Self Catering. QP fields: package_boardBasis"
  }

  dimension: package_duration {
    type: number
    sql: ${TABLE}.package_duration ;;
    group_label: "Package Info"
    description: "Duration of the package. QP fields: package_duration"
  }

  dimension: package_holiday_type {
    type: string
    sql: ${TABLE}.package_holidayType ;;
    group_label: "Package Info"
    description: "Package holiday type. QP fields: package_holidayType"
  }

  dimension: package_id {
    type: string
    sql: ${TABLE}.package_id ;;
    group_label: "Package Info"
    description: "ID unique to package. QP fields: package_id"
  }

  dimension: package_line_of_business {
    type: string
    sql: ${TABLE}.package_lineOfBusiness ;;
    group_label: "Package Info"
    description: "Line of business. QP fields: package_lineOfBusiness"
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.package_name ;;
    group_label: "Package Info"
    description: "Name of package. QP fields: package_name"
  }

  dimension: package_number_of_adults {
    type: number
    sql: ${TABLE}.package_numberOfAdults ;;
    group_label: "Package Info"
    description: "Number of adults included in the package. QP fields: package_numberOfAdults"
  }

  dimension: package_number_of_children {
    type: number
    sql: ${TABLE}.package_numberOfChildren ;;
    group_label: "Package Info"
    description: "Number of children included in the package. QP fields: package_numberOfChildren"
  }

  dimension: package_number_of_infants {
    type: number
    sql: ${TABLE}.package_numberOfInfants ;;
    group_label: "Package Info"
    description: "Number of infants included in the package. QP fields: package_numberOfInfants"
  }

  dimension: package_package_provider {
    type: string
    sql: ${TABLE}.package_packageProvider ;;
    group_label: "Package Info"
    description: "Code of the package provider. QP fields: package_packageProvider"
  }

  dimension: package_brochure_code {
    type: string
    sql: ${TABLE}.package_brochureCode ;;
    group_label: "Package Info"
    description: "The brochure code, e.g. NVLI. QP fields: package_brochureCode"
  }

  dimension: package_deposit_base_value {
    type: number
    sql: ${TABLE}.package_deposit_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Package deposit value. QP fields: package_deposit_baseValue"
  }

  dimension: package_discount_base_value {
    type: number
    sql: ${TABLE}.package_discount_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Package discount value. QP fields: package_discount_baseValue"
  }

  dimension: package_original_price_base_value {
    type: number
    sql: ${TABLE}.package_originalPrice_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Original price (i.e. before discount) of a package in transaction. QP fields: package_originalPrice_baseValue"
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.package_price_baseCurrency ;;
    group_label: "Package Monetary Info"
    description: "Currency of transaction. QP fields: package_price_baseCurrency"
  }

  dimension: package_price_base_value {
    type: number
    sql: ${TABLE}.package_price_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Backage base price (i.e. without discount or taxes) of a package in transaction. QP fields: package_price_baseValue"
  }

  dimension: package_subtotal_base_value {
    type: number
    sql: ${TABLE}.package_subtotal_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Package subtotal before discount and before tax of a package in transaction. QP fields: package_subtotal_baseValue"
  }

  dimension: package_subtotal_including_tax_base_value {
    type: number
    sql: ${TABLE}.package_subtotalIncludingTax_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Package subtotal before discount and after tax of a package in transaction. QP fields: package_subtotalIncludingTax_baseValue"
  }

  dimension: package_tax_base_value {
    type: number
    sql: ${TABLE}.package_tax_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Amount of tax applied to a certain transaction (base currency, measure). QP fields: package_tax_baseValue"
  }

  dimension: package_total_base_value {
    type: number
    sql: ${TABLE}.package_total_baseValue ;;
    group_label: "Package Monetary Info"
    description: "Final total paid by user. QP fields: package_total_baseValue"
  }

  dimension: package_total_number {
    type: number
    sql: ${TABLE}.package_totalNumber ;;
    group_label: "Package Monetary Info"
    description: "Number of items in package. QP fields: package_totalNumber"
  }

  dimension: package_type {
    type: string
    sql: ${TABLE}.package_type ;;
    group_label: "Package Info"
    description: "Type of package. QP fields: package_type"
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
    description: "ID unique to the transaction. QP fields: transaction_id"
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }

  measure: converters {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id) ;;
    description: "Count of unique visitor_ids on views that are labeled with any non-null transaction_id. "
  }

  measure: transactions {
    type: number
    sql:  COUNT(DISTINCT ${transaction_id}) ;;
    description: "Count of unique transaction_ids (always exact count). QP fields: transaction_id"
  }

  measure: average_order_value {
    type: number
    sql:  SUM(${TABLE}.package_total_baseValue) / COUNT_DISTINCT(${transaction_id}) ;;
    value_format_name: decimal_2
    description: "Average of transaction value of all transactions. QP fields: package_total_baseValue"
  }

  measure: revenue_per_converter {
    type: number
    sql:  SUM(${TABLE}.transaction_total) / COUNT(DISTINCT ${TABLE}.context_id) ;;
    value_format_name: decimal_2
    description: "Number of weeks between the current transaction and previous transaction by the same visitor. QP fields: transaction_total, context_id"
  }

  measure: session_conversion_rate {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.session_id) /  COUNT(DISTINCT ${qshopdemo_view_v01.session_id}) ;;
    value_format_name: percent_2
    description: "Share of unique sessions containing page views that are labeled with any non-null transaction_id in all sessions.  QP fields: context_id, context_sessionNumber"
  }

  measure: visitor_conversion_rate {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id) /  COUNT(DISTINCT ${qshopdemo_view_v01.context_id}) ;;
    value_format_name: percent_2
    description: "Share of unique visitors on page views that are labeled with any non-null transaction_id in all visitors. QP fields: context_id"
  }

  measure: sum_of_transaction_total {
    type: sum
    sql: ${TABLE}.transaction_total ;;
    value_format_name: decimal_2
    description: "Total order value (base currency, measure). QP fields: transaction_total"
  }

  measure: sum_of_transaction_discount {
    type: sum
    sql: ${TABLE}.package_discount_baseValue ;;
    value_format_name: decimal_2
    description: "Amount of discount applied to a certain transaction (base currency, measure). QP fields: package_discount_baseValue"
  }

  measure: sum_of_transaction_tax {
    type: sum
    sql: ${TABLE}.package_tax_baseValue ;;
    value_format_name: decimal_2
    description: "Amount of tax applied to a certain transaction (base currency, measure). QP fields: package_tax_baseValue"
  }

  measure: revenue_per_visitor {
    type: number
    sql: ${qshopdemo_transaction_v01.sum_of_transaction_total} / ${qshopdemo_view_v01.view_visitors} ;;
    value_format_name: decimal_2
    description: "Sum of transaction_total divided by count of unique visitor_ids. QP fields: transaction_total, context_id"
  }

  measure: hours_since_previous_purchase {
    type: average
    sql: TIMESTAMP_DIFF(${TABLE}.property_event_ts, ${TABLE}.previous_transaction_ts, HOUR)  ;;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of hours between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }

  measure: days_since_previous_purchase {
    type: average
    sql: TIMESTAMP_DIFF(${TABLE}.property_event_ts, ${TABLE}.previous_transaction_ts, DAY);;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of days between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }

  measure: weeks_since_previous_purchase {
    type: average
    sql: DATE_DIFF(CAST(${TABLE}.property_event_ts AS DATE), CAST(${TABLE}.previous_transaction_ts AS DATE),WEEK)  ;;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of weeks between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }
}