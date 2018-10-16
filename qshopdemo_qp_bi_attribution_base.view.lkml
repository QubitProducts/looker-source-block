view: qshopdemo_qp_bi_attribution_base {

  #version 2
  sql_table_name:  `qubit-client-37403.qshopdemo__v2.livetap_attribution` ;;

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
    description: "Visitor ID. QP fields: derived"
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    label: "Session Number"
    description: "User session number. QP fields: context_sessionNumber"
  }

  dimension: context_conversion_number {
    type: number
    sql: ${TABLE}.context_conversionNumber ;;
    label: "Conversion Number"
    hidden: yes
  }

  dimension: entry_id {
    type: string
    sql: ${TABLE}.entry_id ;;
    label: "Attribution Entry ID"
    description: "Unique entry ID. An entry is a unique pair of entrance and session numbers. QP fields: context_id, context_entranceNumber, context_sessionNumber, context_conversionNumber"
    primary_key: yes
  }
  
  dimension_group: entry_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.entry_timestamp ;;
    label: "Entry Time - "
    description: "Timestamp of an entry. QP field: meta_serverTs"
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    label: "Order Date"
    hidden: yes
  }

  dimension: meta_tracking_id {
    type: string
    sql: ${TABLE}.meta_trackingId ;;
    hidden:  yes
  }

  dimension: order_ids_in_purchase_cycle {
    type: string
    sql: ${TABLE}.order_ids_in_purchase_cycle ;;
    label: "Order IDs in Purchase Cycle"
    description: "IDs of orders processed in the same user session. QP fields: transaction_id "
  }

  #first order
  dimension: lead_order_id {
    type: string
    sql: ${TABLE}.lead_order_id ;;
    hidden: yes
  }

  dimension: purchase_cycle_group {
    type: string
    sql: ${TABLE}.purchase_cycle_group ;;
    label: "Purchase Cycle Group (1,2,3,4,5+)"
    description: "Bucket for purchase cycle. Has followig values  (1,2,3,4,5+). QP fields: context_conversionNumber"
    }

  dimension: entries_in_purchase_cycle {
    type: number
    sql: ${TABLE}.entries_in_purchase_cycle ;;
    label: "Entries in Purchase Cycle"
    description: "Number of entries in purchase cycle. QP fields: derived"
  }

  dimension_group: purchase_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.purchase_timestamp ;;
    label: "Order Time - "
    description: "Timestamp of the purchase. QP fields: meta_serverTs"

  }

  dimension: ranked_entry_number {
    type: number
    sql: ${TABLE}.ranked_entry_number ;;
    label: "Entry Number"
    description: "Sequential entry number, starts with 1. Ordered by timestamp of entry in ascending order. QP fields: derived"
  }

  dimension: ranked_entry_number_reverse {
    type: number
    sql: ${TABLE}.ranked_entry_number_reverse ;;
    hidden: yes
  }

  dimension: ranked_purchase_number_int {
    type: number
    sql: ${TABLE}.ranked_purchase_number_int ;;
    label: "Purchase Cycle"
    description: "Represents the number of orders the user has had. QP fields: context_conversionNumber"
  }

  dimension: referrer_ad_group {
    type: string
    sql: ${TABLE}.referrer_adGroup ;;
    group_label: "Entry Referrer"
    description: "Referrer Ad Group - as emitted. QP fields: referrer_adGroup"
  }

  dimension: referrer_campaign {
    type: string
    sql: ${TABLE}.referrer_campaign ;;
    group_label: "Entry Referrer"
    description: "Referrer Campaign - as emitted. QP fields: referrer_campaign"

  }

  dimension: referrer_content {
    type: string
    sql: ${TABLE}.referrer_content ;;
    group_label: "Entry Referrer"
    description: "Referrer Content - as emitted. QP fields: referrer_content"
  }

  dimension: referrer_domain {
    type: string
    sql: ${TABLE}.referrer_domain ;;
    group_label: "Entry Referrer"
    description: "Referrer Domain - as emitted. QP fields: referrer_domain"
  }

  dimension: referrer_keywords {
    type: string
    sql: ${TABLE}.referrer_keywords ;;
    group_label: "Entry Referrer"
    description: "Referrer Keywords - as emitted. QP fields: referrer_keywords"
  }

  dimension: referrer_label {
    type: string
    sql: ${TABLE}.referrer_label ;;
    group_label: "Entry Referrer"
    description: "Referrer Label - as emitted. QP fields: referrer_label"
  }

  dimension: referrer_match_type {
    type: string
    sql: ${TABLE}.referrer_matchType ;;
    group_label: "Entry Referrer"
    description: "Referrer Match Type - as emitted. QP fields: referrer_matchType"
  }

  dimension: referrer_media_type {
    type: string
    sql: ${TABLE}.referrer_mediaType ;;
    group_label: "Entry Referrer"
    description: "Referrer Media Type - as emitted. QP fields: referrer_mediaType"
  }

  dimension: referrer_network {
    type: string
    sql: ${TABLE}.referrer_network ;;
    group_label: "Entry Referrer"
    description: "Referrer Network - as emitted. QP fields: referrer_network"
  }

  dimension: referrer_search_query {
    type: string
    sql: ${TABLE}.referrer_searchQuery ;;
    group_label: "Entry Referrer"
    description: "Referrer Search Query - as emitted. QP fields: referrer_searchQuery"

  }

  dimension: referrer_type {
    type: string
    sql: ${TABLE}.referrer_type ;;
    group_label: "Entry Referrer"
    label: "Original Referrer"
    description: "referrer_type of an entry - as emitted. QP fields: referrer_type"
  }

  dimension: touchpoint {
    type: string
    sql: ${TABLE}.touchpoint ;;
    label: "Touchpoint (first, assist, last, single)"
    description: "Classification of entries based on Entry Number with values Single, First, Last, Assist. QP fields: derived"
  }

  dimension: true_referrer_type {
    type: string
    sql: ${TABLE}.true_referrer_type ;;
    group_label: "Entry Referrer"
    label: "Categorised Referrer"
    description: "Mapped referrer based on the emitted referrer_type. QP fields: referrer_type"
  }

  measure: behavioural_value_livetap {
    type: number
    sql: SUM(${TABLE}.behavioural_value /  ${TABLE}.pageviews_in_entry) ;;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry based on the proportion of pageviews in current entry compared to the number of pageviews in all entries in a purchase cycle. The more pageviews an entry had, the higher the behavioural value. . QP fields: derived - basket_total_baseValue"
    label: "Behavioural Value"
  }

  measure: even_click_value_livetap {
    type: number
    sql: SUM(${TABLE}.even_click_value / ${TABLE}.pageviews_in_entry );;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - the value of an entry based ratio of this entry to the total number of entries. QP fields: derived - basket_total_baseValue"
    label: "Even Click Value"
  }

  measure: first_click_value_livetap {
    type: number
    sql: SUM(${TABLE}.first_click_value / ${TABLE}.pageviews_in_entry );;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - set to full conversion value if the entry was first. QP fields: derived - basket_total_baseValue"
    label: "First Click Value"
  }

  measure: last_click_value_livetap {
    type: number
    sql: SUM(${TABLE}.last_click_value / ${TABLE}.pageviews_in_entry  );;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - set to full conversion value if the entry was last. QP fields: derived - basket_total_baseValue"
    label: "Last Click Value"
  }

  measure: behavioural_value {
    # only for attribution standalone model use
    type: number
    sql: SUM(${TABLE}.behavioural_value) ;;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry based on the proportion of pageviews in current entry compared to the number of pageviews in all entries in a purchase cycle. The more pageviews an entry had, the higher the behavioural value. . QP fields: derived - basket_total_baseValue"
  }

  measure: even_click_value {
    # only for attribution standalone model use
    type: number
    sql: SUM(${TABLE}.even_click_value);;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - the value of an entry based ratio of this entry to the total number of entries. QP fields: derived - basket_total_baseValue"
  }

  measure: first_click_value {
    # only for attribution standalone model use
    type: number
    sql: SUM(${TABLE}.first_click_value);;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - set to full conversion value if the entry was first. QP fields: derived - basket_total_baseValue"
  }

  measure: last_click_value {
    # only for attribution standalone model use
    type: number
    sql: SUM(${TABLE}.last_click_value);;
    value_format_name: decimal_2
    description: "Monetary value attributed to an entry - set to full conversion value if the entry was last. QP fields: derived - basket_total_baseValue"
  }

  measure: conversion_value_in_purchase_cycle {
    type:  sum
    sql: ${TABLE}.conversion_value_in_purchase_cycle  ;;
    value_format_name: decimal_2
    description: "Summed transactional value for an 'attribution' order. NB. an order in attribution is a set of transactions processed in the same session . QP fields: derived - basket_total_baseValue"
  }

  measure: entry_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.entry_id) ;;
    label: "Attribution Entry Count"
    description: "Number of unique entries. QP fields: dervied"
  }

  measure: attribution_order_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.order_ids_in_purchase_cycle) ;;
    label: "Attribution Order Count"
    description: "Number of attribution orders. NB. an order in attribution is a set of transactions processed in the same session . QP fields: derived"
  }

  measure: distinct_referrer_types {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.true_referrer_type) ;;
    label: "Distinct Referrer Types"
    description: "Number of distinct referrers. QP fields: referrer_type"
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.pageviews_in_entry ;;
    label: "Views In Attribution Entry"
    description: "Number of views user had in entry. QP fields: context_id "
  }
}
