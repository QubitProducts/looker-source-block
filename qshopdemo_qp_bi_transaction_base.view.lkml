#File uploaded: Mon Apr 09 14:05:48 GMT 2018
view: qshopdemo_qp_bi_transaction_base {
  #version 1.1
  sql_table_name:  [qubit-client-37403:qshopdemo.qp_bi_transaction] ;;

  dimension: basket_tax_base_value {
    label: "Transaction Tax"
    type: number
    sql: ${TABLE}.basket_tax_baseValue ;;
    description: "Amount of tax applied to a certain transaction (base currency). QP fields: basket_tax_baseValue"
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: basket_total_base_value {
    label: "Transaction Total"
    type: number
    sql: ${TABLE}.basket_total_baseValue ;;
    description: "Total order value (base currency). QP fields: basket_total_baseValue"
  }

  dimension: basket_subtotal_baseValue {
    label: "Transaction Subtotal"
    type: number
    sql: ${TABLE}.basket_subtotal_baseValue ;;
    description: "Order subtotal (base currency), before discount. QP fields: basket_subtotal_baseValue"
  }

  dimension: basket_quantity {
    label: "Transaction Item Quantity"
    type: number
    sql: ${TABLE}.basket_quantity ;;
    description: "Number of items in a basket for a certain transaction (dimension). QP fields: basket_quantity"
  }

  dimension: basket_discount_baseValue {
    label: "Transaction Discount"
    type: number
    sql: ${TABLE}.basket_discount_baseValue ;;
    description: "Amount of discount applied to a certain transaction (base currency, dimension). QP fields: basket_discount_baseValue"
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: new_vs_returning_purchaser {
    type: string
    sql: IF(${TABLE}.transaction_id IS NOT NULL, IF(${TABLE}.context_conversionNumber > 0, "returning", "new" ), NULL) ;;
    label: "New Vs Returning Purchased Status"
    description: "Returns 'new' if this is the first purchase of the visitor, otherwise 'returning'. QP fields: context_conversionNumber"
  }

  dimension: context_id {
    label: "Visitor ID"
    type: string
    sql: ${TABLE}.context_id ;;
    description: "ID unique to the visitor (only for views that are labeled with any non-null transaction_id). QP fields: context_id"
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    label: "Session Number"
    description: "Session number of the visitor, in a lifetime. QP fields: context_sessionNumber"
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    label: "Transaction Date"
    hidden: yes
  }

    dimension: transaction_total {
      type: string
      sql: ${TABLE}.transaction_total ;;
      hidden: yes
    }

  dimension: weeks_since_first_entry {
    type: number
    sql: ROUND(DATEDIFF(${TABLE}.property_event_ts, TIMESTAMP((DATE(${qshopdemo_qp_bi_view_v01.visitor_first_entry_date} )))) / 7, 0) ;;
    label: "Weeks Since First Entry"
    group_label: "Time Since First Entry"
    value_format_name: decimal_0
    description: "Number of weeks between the first view of a visitor and a certain transaction. QP fields: meta_serverTs, meta_recordDate"
  }
  
  dimension: days_since_first_entry {
    type: number
    sql: DATEDIFF(${TABLE}.property_event_ts, TIMESTAMP((DATE(${qshopdemo_qp_bi_view_v01.visitor_first_entry_date} )))) ;;
    label: "Days Since First Entry"
    group_label: "Time Since First Entry"
    value_format_name: decimal_0
    description: "Number of days between the first view of a visitor and a certain transaction. QP fields: meta_serverTs, meta_recordDate"
  }

  dimension_group: time_data_points {
    label: "Time Data Points"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "Time Data Points"
    description: "Timestamp of the transaction. QP fields:  meta_serverTs (with applied UTC offset, also accounting for daylight saving time)"
  }
  
  dimension_group: time_data_points_previous_transaction {
    label: "Time Data Points - Previous Transaction"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql: MSEC_TO_TIMESTAMP(${TABLE}.previous_transaction_ts) ;;
    group_label: "Time Data Points - Previous Transaction"
    description: "Timestamp of the previous transaction of the visitor. QP fields: meta_server_ts"
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
    description: "ID unique to the transaction. QP fields: transaction_id"
  }

  dimension: discount_applied {
    type: yesno
    sql: ${TABLE}.transaction_id IS NOT NULL AND ${TABLE}.basket_discount_baseValue IS NOT NULL ;;
    description: "Returns 'yes' if total transaction value was discounted, 'no' otherwise. QP fields: transaction_id, basket_discount_baseValue"
  }

  measure: converters {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id, 1000000) ;;
    description: "Count of unique visitor_ids on views that are labeled with any non-null transaction_id. If above 1.000.000, the result is approximated. QP fields: context_id, transaction_id"
  }

  measure: transactions {
    type: number
    sql:  COUNT(DISTINCT ${transaction_id}, 10000000) ;;
    description: "Count of unique transaction_ids (always exact count). QP fields: transaction_id"
  }

  measure: average_order_value {
    type: number
    sql:  SUM(${TABLE}.basket_total_baseValue) / COUNT(DISTINCT ${transaction_id} , 10000000) ;;
    value_format_name: decimal_2
    description: "Average of transaction value of all transactions. QP fields: basket_total_baseValue"
  }

  measure: revenue_per_converter {
    type: number
    sql:  SUM(${TABLE}.basket_total_baseValue) / COUNT(DISTINCT ${TABLE}.context_id, 1000000) ;;
    value_format_name: decimal_2
    description: "Sum of transaction_total divided by count of unique visitor_ids. If count of visitor_ids is above 1.000.000, the result is approximated. Only for views that are labeled with any non-null transaction_id. QP fields: basket_total_baseValue, context_id"
  }

  measure: session_conversion_rate {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.session_id, 1000000) /  COUNT(DISTINCT ${qshopdemo_qp_bi_view_v01.session_id}, 1000000) ;;
    value_format_name: percent_2
    description: "Share of unique sessions containing views that are labeled with any non-null transaction_id in all sessions. For counting, when figures are above 1.000.000, the result is approximated. QP fields: context_sessionNumber, context_id"
  }

  measure: visitor_conversion_rate {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id, 1000000) /  COUNT(DISTINCT ${qshopdemo_qp_bi_view_v01.context_id}, 1000000) ;;
    value_format_name: percent_2
    description: "Share of unique visitors on views that are labeled with any non-null transaction_id in all visitors. For counting, when figures are above 1.000.000, the result is approximated. QP fields: context_id"
  }

  measure: sum_of_transaction_total {
    type: sum
    sql: ${TABLE}.basket_total_baseValue ;;
    value_format_name: decimal_2
    description: "Total order value (base currency, measure). QP fields: transaction_total"
  }

  measure: sum_of_transaction_subtotal {
    type: sum
    sql: ${TABLE}.basket_subtotal_baseValue ;;
    value_format_name: decimal_2
    description: "Order subtotal in base currency. QP fields: basket_subtotal_baseValue"
  }

  measure: sum_of_transaction_discount {
    type: sum
    sql: ${TABLE}.basket_discount_baseValue ;;
    value_format_name: decimal_2
    description: "Amount of discount applied to a certain transaction (base currency, measure). QP fields: basket_discount_baseValue"
  }

  measure: sum_of_transaction_tax {
    type: sum
    sql: ${TABLE}.basket_tax_baseValue ;;
    value_format_name: decimal_2
    description: "Amount of tax applied to a certain transaction (base currency, measure). QP fields: basket_tax_baseValue"
  }

  measure: revenue_per_visitor {
    type: number
    sql: ${qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total} / ${qshopdemo_qp_bi_view_v01.view_visitors} ;;
    value_format_name: decimal_2
    description: "Sum of transaction_total divided by count of unique visitor_ids. If count of visitor_ids is above 1.000.000, the result is approximated. QP fields: basket_total_baseValue, context_id"
  }
  
  measure: sum_of_basket_quantity {
    type: sum
    sql: ${TABLE}.basket_quantity ;;
    description: "Number of items in a basket for a certain transaction (measure). QP fields: basket_quantity"
  }
  
  measure: average_products_per_order {
    type: average
    sql: ${TABLE}.basket_quantity ;;
    value_format_name: decimal_2
    description: "Average quantity of items in the basket per transaction. QP fields: basket_quantity"
  }
  
  measure: hours_since_previous_purchase {
    type: average
    sql: (TIMESTAMP_TO_MSEC(${TABLE}.property_event_ts) - ${TABLE}.previous_transaction_ts) / (1000*60*60)  ;;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of hours between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }

  measure: days_since_previous_purchase {
    type: average
    sql: (TIMESTAMP_TO_MSEC(${TABLE}.property_event_ts) - ${TABLE}.previous_transaction_ts) / (1000*60*60*24)  ;;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of days between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }

  measure: weeks_since_previous_purchase {
    type: average
    sql: (TIMESTAMP_TO_MSEC(${TABLE}.property_event_ts) - ${TABLE}.previous_transaction_ts) / (1000*60*60*24*7)  ;;
    value_format_name: decimal_2
    group_label: "Time Since Previous Purchase"
    description: "Number of weeks between the current transaction and previous transaction by the same visitor. QP fields: property_event_ts"
  }
  
  measure: shipping_cost {
    type: sum
    sql: ${TABLE}.basket_shippingPrice_baseValue ;;
    value_format_name: decimal_0
    label: "Shipping cost"
  }
  
  dimension: days_since_previous_purchase_dimension {
    type: tier
    tiers: [5,10,20,30,40,50,60,70,80,90,100,150,200,250,300]
    style: integer
    sql: (TIMESTAMP_TO_MSEC(${TABLE}.property_event_ts) - ${TABLE}.previous_transaction_ts) / (1000*60*60*24)  ;;
    value_format_name: decimal_0
  }
  
}
