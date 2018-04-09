#File uploaded: Mon Apr 09 11:03:11 GMT 2018
view: qshopdemo_qp_bi_product_base {

 #version 1.1
 sql_table_name:  [qubit-client-37403:qshopdemo.qp_bi_product] ;;

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    hidden: yes
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
  }



  dimension: unique_row_id {
    type: string
    sql: ${TABLE}.unique_row_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    label: "Visitor ID"
    hidden:  yes
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
    hidden: yes
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    label: "Session Number"
    hidden: yes
  }

  dimension: context_view_number {
    type: number
    sql: ${TABLE}.context_viewNumber ;;
    label: "View Number"
    hidden: yes
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.eventType ;;
    hidden: yes
  }

  dimension: product_interaction_type {
    type: string
    sql: ${TABLE}.product_interaction_type ;;
    group_label: "Product"
    label: "Interaction Type"
    description: "One of six product interaction types for a certain view: Product Detail View, Product Listing View, Product View, Product Purchase, Basket Action, View with Product in Basket. QP fields: meta_type, eventType"
  }
  
  dimension: product_interaction_type_ordered {
    type: string
    sql: CASE WHEN ${TABLE}.product_interaction_type = 'Product Listing View' THEN '1. Product Listing View'
              WHEN ${TABLE}.product_interaction_type = 'Product Detail View' THEN '2. Product Detail View'
              WHEN ${TABLE}.product_interaction_type = 'Product View' THEN '2. Product Detail View'
              WHEN ${TABLE}.product_interaction_type = 'View with Product in Basket' THEN '3. View with Product in Basket'
              WHEN ${TABLE}.product_interaction_type = 'Basket Action' THEN '4. Basket Action'
              WHEN ${TABLE}.product_interaction_type = 'Product Purchase' THEN '5. Product Purchase'
              ELSE ${TABLE}.product_interaction_type END ;;
    group_label: "Product"
    label: "Interaction Type - Ordered"
    description: "One of five product interaction types, prefixed with their order number, for a certain view: 1. Product Listing View, 2. Product Detail View, 3. View with Product in Basket, 4. Basket Action, 5. Product Purchase. QP fields: meta_type, eventType"
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    label: "Date"
    hidden: yes
  }

  dimension_group: time_data_points {
    label: "Time Data Points"
    type: time
    timeframes:  [time, hour_of_day, date, day_of_week, week, week_of_year, month, month_name, quarter_of_year, year]
    sql:  ${TABLE}.property_event_ts ;;
    group_label: "Time Data Points"
    description: "Timestamp of the product interaction event. QP fields:  meta_serverTs (with applied UTC offset, also accounting for daylight saving time)"
  }

  dimension: meta_type {
    type: string
    sql: ${TABLE}.meta_type ;;
    label: "Meta Type"
    hidden: yes
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
    group_label: "Product"
    label: "Category"
    description: "Product category of a product that was displayed, interacted with, or purchased. QP fields: first element in the product_category breadcrumb"
  }

  dimension: product_subcategory {
    type: string
    sql: ${TABLE}.product_subcategory ;;
    group_label: "Product"
    label: "Subcategory"
    description: "Subproduct category of a product that was displayed, interacted with, or purchased. QP fields: second element in the product_category breadcrumb"
  }


  dimension: product_color {
    type: string
    sql: ${TABLE}.product_color ;;
    group_label: "Product"
    label: "Colour"
    description: "Colour of a product that was displayed, interacted with, or purchased. QP fields: product_color"
  }

  dimension: product_manufacturer {
    type: string
    sql: ${TABLE}.product_manufacturer ;;
    group_label: "Product"
    label: "Manufacturer"
    description: "Manufacturer name of a product that was displayed, interacted with, or purchased. QP fields: product_manufacturer"
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    group_label: "Product"
    label: "Name"
    description: "Product name of a product that was displayed, interacted with, or purchased. QP fields: product_name"
  }

  dimension: product_quantity {
    type: number
    sql: IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.quantity, NULL) ;;
    group_label: "Product"
    label: "Purchased Item Quantity"
    description: "Quantity of purchased item. QP fields: quantity"
  }

  dimension: product_original_price_base_value {
    type: number
    sql: ${TABLE}.product_originalPrice_baseValue ;;
    group_label: "Product"
    label: "Original Price"
    description: "Original price (i.e. before discount) of a product that was displayed, interacted with, or purchased. QP fields: product_originalPrice_baseValue"
  }

  dimension: product_price_base_currency {
    type: string
    sql: ${TABLE}.product_price_baseCurrency ;;
    group_label: "Product"
    label: "Currency"
    description: "Price base currency of a product that was displayed, interacted with, or purchased. QP fields: product_price_baseCurrency"
  }

  dimension: product_price_base_value {
    type: number
    sql: ${TABLE}.product_price_baseValue ;;
    group_label: "Product"
    label: "Price"
    description: "Final price (i.e. after discount) of a product that was displayed, interacted with, or purchased. QP fields: product_price_baseValue"
  }

  dimension: product_product_id {
    type: string
    sql: ${TABLE}.product_productId ;;
    group_label: "Product"
    label: "ID"
    description: "Product ID as emitted by website. ID of product which was displayed, interacted with, or purchased. QP fields: product_productId"
  }

  dimension: product_stock {
    type: number
    sql: ${TABLE}.product_stock ;;
    group_label: "Product"
    label: "Stock Level"
    description: "Stock level of a product that was displayed or interacted with. QP fields: product_stock"
  }


  dimension: product_in_stock {
    type: yesno
    sql: ${TABLE}.product_stock > 0;;
    group_label: "Product"
    label: "In Stock"
    description: "True if product was in stock at the time of viewing"
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
    group_label: "Product"
    label: "SKU"
    description: "Product SKU as emitted by website. SKU of product which was displayed, interacted with, or purchased. QP fields: product_sku"
  }

  dimension: product_rating {
    type: number
    sql: ${TABLE}.product_rating ;;
    group_label: "Product"
    label: "Rating"
    description: "Rating of a product that was displayed, interacted with, or purchased. QP fields: product_rating"
  }

  dimension: product_size {
    type: string
    sql: ${TABLE}.product_size ;;
    group_label: "Product"
    label: "Size"
    description: "Size of a product that was displayed, interacted with, or purchased. QP fields: product_size"
  }

  measure: product_visitors {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id, 1000000) ;;
    description: "Count of unique visitor_ids. If above 1.000.000, the result is approximated. Only for views flagged with 'Product Detail View' or 'Product Listing View' interaction type. QP fields: meta_type, context_id"
  }


  measure: product_views {
    type: number
    #LIKE accounts for namespaces - we have a lot of them and they look e.g. tracking_id_ecProduct
    sql: COUNT(DISTINCT(IF(${TABLE}.meta_type LIKE '%ecProduct', ${TABLE}.view_id,NULL)), 1000000);;
    description: "Count of unique combinations of a visitor_id and a view_number. If above 1.000.000, the result is approximated. Only for views flagged with 'Product Detail View' or 'Product Listing View' interaction type. QP fields: meta_type, context_id, context_viewNumber"
  }

  measure: basket_views {
    type: number
    #LIKE accounts for namespaces - we have a lot of them and they look e.g. tracking_id_ecProduct
    sql: COUNT(DISTINCT(IF(${TABLE}.meta_type LIKE '%ecBasketItem', ${TABLE}.view_id,NULL)), 1000000);;
    description: "Count of unique combinations of a visitor_id and a view_number. If above 1.000.000, the result is approximated. Only for views flagged with 'View with Product in Basket' interaction type. QP fields: meta_type, context_id, context_viewNumber"
  }

  measure: converters {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.context_id, NULL), 1000000) ;;
    description: "Count of unique visitor_ids on views that are labeled with 'Product Purchase' interaction type. If above 1.000.000, the result is approximated. QP fields: meta_type, context_id, transaction_id"
  }

  measure: product_orders {
    type: number
    sql: EXACT_COUNT_DISTINCT(${TABLE}.transaction_id) ;;
    description: "Count of unique transaction_ids (always exact count). QP fields: transaction_id"
  }

  measure: product_min_price {
    type: min
    sql: ${TABLE}.product_price_baseValue ;;
    description: "Minimum value of final price of all products that were displayed, interacted with, or purchased. QP fields: product_price_baseValue"
  }

  measure: product_max_price {
    type: max
    sql: ${TABLE}.product_price_baseValue ;;
    description: "Maximum value of final price of all products that were displayed, interacted with, or purchased. QP fields: product_price_baseValue"
  }

  measure: product_average_price {
    type: average
    sql: ${TABLE}.product_price_baseValue ;;
    description: "Average value of final price of all products that were displayed, interacted with, or purchased. QP fields: product_price_baseValue"
  }

  measure: distinct_product_ids {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.product_productId, 1000000) ;;
    description: "Count of unique product_ids that were displayed, interacted with, or purchased. If above 1.000.000, the result is approximated. QP fields: product_productId"
  }

  measure: product_purchased_value {
    type: sum
    sql: IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.subtotal_baseValue ,0) ;;
    value_format_name: decimal_2
    description: "Sum of final product values on views that are labeled with 'Product Purchase' interaction type. QP fields: transaction_id, product_price_baseValue"
  }

  measure: product_quantity_sum {
    type: sum
    sql: IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.quantity, NULL);;
    label: "Product Purchased Item Total Quantity"
    description: "Summed quantity of purchased items. QP fields: quantity"
  }

  measure: product_quantity_average {
    type: number
    sql: ${product_quantity_sum} / ${product_orders};;
    ##sql: SUM(IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.quantity, NULL)) /  EXACT_COUNT_DISTINCT(${TABLE}.transaction_id) ;;

    label: "Product Purchased Item Average Quantity"
    description: "An average quantity of purchased items. QP fields: quantity"
    value_format_name: decimal_2

  }

}
