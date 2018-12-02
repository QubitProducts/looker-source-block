view: q_package_item {

  # Qubit LookML | Travel | V2
  derived_table: {
    sql:
      SELECT
        *
      FROM
        `qubit-client-{{q_view_v01.project._parameter_value}}.{{q_view_v01.site._parameter_value}}__v2.livetap_package_item`
      WHERE
        {% condition q_view_v01.time_data_points_date  %} property_event_ts {% endcondition %}
      ;;
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

  dimension: context_conversion_number {
    type: number
    sql: ${TABLE}.context_conversionNumber ;;
    hidden: yes
  }

  dimension: context_entrance_number {
    type: number
    sql: ${TABLE}.context_entranceNumber ;;
    hidden: yes
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}.context_id ;;
    hidden: yes
  }

  dimension: context_session_number {
    type: number
    sql: ${TABLE}.context_sessionNumber ;;
    hidden: yes
  }

  dimension: context_view_number {
    type: number
    sql: ${TABLE}.context_viewNumber ;;
    hidden: yes
  }

  dimension: entrance_id {
    type: string
    sql: ${TABLE}.entrance_id ;;
    hidden: yes
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.eventType ;;
    hidden: yes
  }

  dimension: meta_id {
    type: string
    sql: ${TABLE}.meta_id ;;
    hidden: yes
  }

  dimension: meta_record_date {
    type: string
    sql: ${TABLE}.meta_recordDate ;;
    hidden: yes
  }

  dimension: meta_ts {
    type: number
    sql: ${TABLE}.meta_ts ;;
    hidden: yes
  }

  dimension: meta_type {
    type: string
    sql: ${TABLE}.meta_type ;;
    hidden: yes
  }

  dimension: package_board_basis {
    type: string
    sql: ${TABLE}.package_boardBasis ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: interaction_type {
    type: string
    sql: ${TABLE}.interaction_type ;;
    description: "One of three product interaction types for a certain view: Package View, Package Checkout, Package Purchase. QP fields: interaction_type"
  }
  
  dimension: interaction_type_ordered {
    type: string
    sql: CASE WHEN ${TABLE}.interaction_type = 'Package View' THEN '1. Package View'
              WHEN ${TABLE}.interaction_type = 'Package Checkout' THEN '2. Package Checkout'
              WHEN ${TABLE}.interaction_type = 'Package Purchase' THEN '3. Package Purchase'
              ELSE ${TABLE}.interaction_type END ;;
    label: "Interaction Type - Ordered"
  }

  dimension: package_deposit_base_value {
    type: number
    sql: ${TABLE}.package_deposit_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_discount_base_value {
    type: number
    sql: ${TABLE}.package_discount_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_duration {
    type: number
    sql: ${TABLE}.package_duration ;;
    group_label: "Package Item"
    description: "Package duration in days. QP fields: package_duration"
  }

  dimension: package_holiday_type {
    type: string
    sql: ${TABLE}.package_holidayType ;;
    group_label: "Package Item"
    description: "The type of holiday. QP fields: package_holidayType"
  }

  dimension: package_id {
    type: string
    sql: ${TABLE}.package_id ;;
    group_label: "Package Item"
    label: "Package ID"
    description: "ID unique to package. QP fields: package_id"
  }

  dimension: package_item_accommodation_address_country {
    type: string
    sql: ${TABLE}.packageItem_accommodation_address_country ;;
    group_label: "Accommodation"
    label: "Country"
    description: "Accommodation country name. QP fields: packageItem_accommodation_address_country"
  }

  dimension: package_item_accommodation_address_country_code {
    type: string
    sql: ${TABLE}.packageItem_accommodation_address_countryCode ;;
    group_label: "Accommodation"
    label: "Country Code"
    description: "Accommodation country code. This field should be used in Looker to creatre any geographical map visualizations. QP fields: packageItem_accommodation_address_countryCode"
  }

  dimension: package_item_accommodation_board_basis {
    type: string
    sql: ${TABLE}.packageItem_accommodation_boardBasis ;;
    group_label: "Accommodation"
    label: "Board Basis"
    description: "Board basis associated with the accommodation, e.g. All Inclusive, Continental Breakfast, Self Catering. QP fields: packageItem_accommodation_boardBasis"
  }

  dimension: package_item_accommodation_id {
    type: string
    sql: ${TABLE}.packageItem_accommodation_id ;;
    group_label: "Accommodation"
    label: "Accommodation ID"
    description: "ID unique to resort. QP fields: packageItem_accommodation_id"
  }

  dimension: package_item_accommodation_max_occupancy {
    type: number
    sql: ${TABLE}.packageItem_accommodation_maxOccupancy ;;
    group_label: "Accommodation"
    label: "Max Occupancy"
    description: "Max occupancy of the package that was displayed, interacted with, or purchased. QP fields: packageItem_accommodation_maxOccupancy"
  }

  dimension: package_item_accommodation_name {
    type: string
    sql: ${TABLE}.packageItem_accommodation_name ;;
    group_label: "Accommodation"
    label: "Accommodation Name"
    description: "The assigned name of resort. QP fields: packageItem_accommodation_name"
  }

  dimension: package_item_accommodation_normalized_rating {
    type: number
    sql: ${TABLE}.packageItem_accommodation_normalizedRating ;;
    group_label: "Accommodation"
    label: "Accommodation Rating"
    description: "Rating of the resort. QP fields: packageItem_accommodation_normalizedRating"
  }

  dimension: package_item_accommodation_rooms {
    type: number
    sql: ${TABLE}.packageItem_accommodation_rooms ;;
    group_label: "Accommodation"
    label: "Rooms"
    description: "Number of rooms in the accommodation listing. QP fields: packageItem_accommodation_rooms"
  }

  dimension: package_item_accommodation_stars {
    type: number
    sql: ${TABLE}.packageItem_accommodation_stars ;;
    group_label: "Accommodation"
    label: "Stars"
    description: "Number of stars associated with the listing. QP fields: packageItem_accommodation_stars"
  }

  dimension: package_item_ancillary_ancillary_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_ancillaryType ;;
    group_label: "Ancillary"
    label: "Ancillary Type"
    description: "Type of anciliary package item, e.g. insurance, luggage, meal. QP fields: packageItem_ancillary_ancillaryType"
  }

  dimension: package_item_ancillary_insurance_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_insurance_type ;;
    group_label: "Ancillary"
    label: "Insurance Type"
    description: "Insurance type associated with the package item. QP fields: packageItem_ancillary_insurance_type"
  }

  dimension: package_item_ancillary_luggage_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_luggage_type ;;
    group_label: "Ancillary"
    label: "Luggage Type"
    description: "Luggage type associated with the package item. QP fields: packageItem_ancillary_luggage_type"
  }

  dimension: package_item_ancillary_meal_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_meal_type ;;
    group_label: "Ancillary"
    label: "Meal Type"
    description: "Meal types associated with the package item. QP fields: packageItem_ancillary_meal_type"
  }

  dimension: package_item_ancillary_parking_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_parking_type ;;
    group_label: "Ancillary"
    label: "Parking Type"
    description: "Parking type associated with the package. QP fields: packageItem_ancillary_parking_type"
  }

  dimension: package_item_ancillary_pet_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_pet_type ;;
    group_label: "Ancillary"
    label: "Pet"
    description: "Indicates whether the resort is pet-friendly or not. QP fields: packageItem_ancillary_pet_type"
  }

  dimension: package_item_ancillary_priority_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_priority_type ;;
    group_label: "Ancillary"
    label: "Priority Type"
    description: "Priority Type. QP fields: packageItem_ancillary_priority_type"
  }

  dimension: package_item_ancillary_seats_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_seats_type ;;
    group_label: "Ancillary"
    label: "Seat Type"
    description: "Indicates if a visitor chose seats manually or was assigned with seats and which seats have been chosen. QP fields: packageItem_ancillary_seats_type"
  }

  dimension: package_item_ancillary_sports_equipment_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_sportsEquipment_type ;;
    group_label: "Ancillary"
    label: "Sports Equipment Type"
    description: "Sports Equipment Type. QP fields: packageItem_ancillary_sportsEquipment_type"
  }

  dimension: package_item_ancillary_towel_quantity {
    type: number
    sql: ${TABLE}.packageItem_ancillary_towel_quantity ;;
    group_label: "Ancillary"
    label: "Towel Quantity"
    description: "Number of towels included. QP fields: packageItem_ancillary_towel_quantity"
  }

  dimension: package_item_ancillary_transfers_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_transfers_type ;;
    group_label: "Ancillary"
    label: "Transfer Type"
    description: "Type of airport/station transfer. QP fields: packageItem_ancillary_transfers_type"
  }

  dimension: package_item_ancillary_transfers_vendor {
    type: string
    sql: ${TABLE}.packageItem_ancillary_transfers_vendor ;;
    group_label: "Ancillary"
    label: "Transfer Vendor"
    description: "Cost of airport/station transfer. QP fields: packageItem_ancillary_transfers_vendor"
  }

  dimension: package_item_ancillary_vehicle_rental_type {
    type: string
    sql: ${TABLE}.packageItem_ancillary_vehicleRental_type ;;
    group_label: "Ancillary"
    label: "Vehicle Rental Type"
    description: "Type of rental if vehicle was rented. QP fields: packageItem_ancillary_vehicleRental_type"
  }

  dimension: package_item_ancillary_wifi_id {
    type: string
    sql: ${TABLE}.packageItem_ancillary_wifi_id ;;
    group_label: "Ancillary"
    label: "Wifi"
    description: "Indicates if wireless internet network is avalable. QP fields: packageItem_ancillary_wifi_id"
  }

  dimension: package_item_id {
    type: string
    sql: ${TABLE}.packageItem_id ;;
    group_label: "Package Item"
    description: "ID unique to package item. QP fields: packageItem_id"
  }

  dimension: package_item_journey_destination_code {
    type: string
    sql: ${TABLE}.packageItem_journey_destinationCode ;;
    group_label: "Journey"
    label: "Destination Code"
    description: "Journey destination country code. This field should be used in Looker to creatre any geographical map visualizations. QP fields: packageItem_journey_destinationCode"
  }

  dimension: package_item_journey_destination_country {
    type: string
    sql: ${TABLE}.packageItem_journey_destinationCountry ;;
    group_label: "Journey"
    label: "Destination Country"
    description: "Journey destination country name. QP fields: packageItem_journey_destinationCountry"
  }

  dimension: package_item_journey_destination_name {
    type: string
    sql: ${TABLE}.packageItem_journey_destinationName ;;
    group_label: "Journey"
    label: "Destination Name"
    description: "Journey destination name. QP fields: packageItem_journey_destinationName"
  }

  dimension: package_item_journey_id {
    type: string
    sql: ${TABLE}.packageItem_journey_id ;;
    group_label: "Journey"
    label: "Journey ID"
    hidden: yes
  }

  dimension: package_item_journey_journey_type {
    type: string
    sql: ${TABLE}.packageItem_journey_journeyType ;;
    group_label: "Journey"
    label: "Journey Type"
    description: "Type of the journey, can be inbound or outbound. QP fields: packageItem_journey_journeyType"
  }

  dimension: package_item_journey_operator {
    type: string
    sql: ${TABLE}.packageItem_journey_operator ;;
    group_label: "Journey"
    label: "Operator"
    description: "Journey operator (airlines). QP fields: packageItem_journey_operator"
  }

  dimension: package_item_journey_origin_code {
    type: string
    sql: ${TABLE}.packageItem_journey_originCode ;;
    group_label: "Journey"
    label: "Origin Code"
    description: "Journey origin country code. This field should be used in Looker to creatre any geographical map visualizations. QP fields: packageItem_journey_originCode"
  }

  dimension: package_item_journey_origin_country {
    type: string
    sql: ${TABLE}.packageItem_journey_originCountry ;;
    group_label: "Journey"
    label: "Origin Country"
    description: "Journey origin country name. QP fields: packageItem_journey_originCountry"
  }

  dimension: package_item_journey_origin_name {
    type: string
    sql: ${TABLE}.packageItem_journey_originName ;;
    group_label: "Journey"
    label: "Origin Name"
    description: "Journey origin name. QP fields: packageItem_journey_originName"
  }

  dimension: package_item_journey_price_base_value {
    type: number
    sql: ${TABLE}.packageItem_journey_price_baseValue ;;
    group_label: "Journey"
    label: "Price Base Value"
    description: "Final price (i.e. after discount) of a journey that was displayed, interacted with, or purchased. QP fields: packageItem_journey_price_baseValue"
  }

  dimension: package_item_journey_travel_time {
    type: number
    sql: ${TABLE}.packageItem_journey_travelTime ;;
    group_label: "Journey"
    label: "Travel Time"
    description: "Journey travel time. QP fields: packageItem_journey_travelTime"
  }

  dimension: package_item_on_sale {
    type: yesno
    sql: ${TABLE}.packageItem_onSale ;;
    group_label: "Package Item"
    label: "On Sale?"
    description: "Returns 'Yes' if the package item is on sale, 'No' if not. QP fields: packageItem_onSale"
  }

  dimension: package_item_original_price_base_value {
    type: number
    sql: ${TABLE}.packageItem_originalPrice_baseValue ;;
    group_label: "Package Item"
    label: "Original Price"
    description: "Original price (i.e. before discount) of a package item that was displayed, interacted with, or purchased. QP fields: packageItem_originalPrice_baseValue"
  }

  dimension: package_item_package_item_type {
    type: string
    sql: ${TABLE}.packageItem_packageItemType ;;
    group_label: "Package Item"
    label: "Package Item Type"
    description: "Package item type, e.g. accommodation, journey. QP fields: packageItem_packageItemType"
  }

  dimension: package_item_price_base_value {
    type: number
    sql: ${TABLE}.packageItem_price_baseValue ;;
    group_label: "Package Item"
    description: "Final price (i.e. after discount) of a package item that was displayed, interacted with, or purchased. QP fields: packageItem_price_baseValue"
  }

  dimension: package_item_package_type {
    type: string
    sql: ${TABLE}.packageItem_packageType ;;
    group_label: "Package Item"
    description: "Package type. QP fields: packageItem_packageType"
  }

  dimension: package_line_of_business {
    type: string
    sql: ${TABLE}.package_lineOfBusiness ;;
    group_label: "Package Item"
    description: "Line of business. QP fields: package_lineOfBusiness"
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.package_name ;;
    group_label: "Package Item"
    description: "Name of package. QP fields: package_name"
  }

  dimension: package_number_of_adults {
    type: number
    sql: ${TABLE}.package_numberOfAdults ;;
    group_label: "Package Item"
    description: "Number of adults travelling. QP fields: package_numberOfAdults"
  }

  dimension: package_number_of_children {
    type: number
    sql: ${TABLE}.package_numberOfChildren ;;
    group_label: "Package Item"
    description: "Number of children travelling. QP fields: package_numberOfChildren"
  }

  dimension: package_number_of_infants {
    type: number
    sql: ${TABLE}.package_numberOfInfants ;;
    group_label: "Package Item"
    description: "Number of infants travelling. QP fields: package_numberOfInfants"
  }

  dimension: package_original_price_base_value {
    type: number
    sql: ${TABLE}.package_originalPrice_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_package_provider {
    type: string
    sql: ${TABLE}.package_packageProvider ;;
    group_label: "Package Item"
    description: "Code of the package provider. QP fields: package_packageProvider"
  }

  dimension: package_price_base_currency {
    type: string
    sql: ${TABLE}.package_price_baseCurrency ;;
    group_label: "Package Item"
    label: "Currency"
    description: "Currency of billing for the package item. QP fields: package_price_baseCurrency"
  }

  dimension: package_price_base_value {
    type: number
    sql: ${TABLE}.package_price_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_subtotal_base_value {
    type: number
    sql: ${TABLE}.package_subtotal_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_subtotal_including_tax_base_value {
    type: number
    sql: ${TABLE}.package_subtotalIncludingTax_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_tax_base_value {
    type: number
    sql: ${TABLE}.package_tax_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_total_base_value {
    type: number
    sql: ${TABLE}.package_total_baseValue ;;
    group_label: "Package"
    hidden: yes
  }

  dimension: package_type {
    type: string
    sql: ${TABLE}.package_type ;;
    group_label: "Package Item"
    description: "Package Type. QP fields: package_type"
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
    hidden: yes
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transaction_id ;;
    description: "ID unique to transaction. Only for views flagged with 'Package Purchase' interaction type. QP fields: transaction_id"
  }

  dimension: unique_row_id {
    type: string
    sql: ${TABLE}.unique_row_id ;;
    hidden: yes
  }

  dimension: view_id {
    type: string
    sql: ${TABLE}.view_id ;;
    hidden: yes
    primary_key: yes
  }
  
  dimension: travel_cohort_group {
    type: string
    sql: ${TABLE}.travel_cohort_group ;;
    group_label: "Package Item"
    description: "Flags each package item with one of: Single, Couple, Family, Group, depending on package_numberOfAdults, package_numberOfChildren, package_numberOfInfants fields. QP fields: package_numberOfAdults, package_numberOfChildren, package_numberOfInfants"
  }

  measure: visitors {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.context_id) ;;
    description: "Count of unique visitor_ids. QP fields: context_id"
  }

  measure: package_views {
    type: number
    sql: SUM(IF(${TABLE}.meta_type = 'trPackageItem', 1, 0));;
    description: "Count of unique combinations of a visitor_id and a view_number. Only for views flagged with 'Package View' interaction type. QP fields: meta_type"
  }

  measure: checkout_views {
    type: number
    sql: SUM(IF(${TABLE}.meta_type = 'trPackageItemCheckout', 1, 0));;
    description: "Count of unique combinations of a visitor_id and a view_number. Only for views flagged with 'Package Checkout' interaction type. QP fields: meta_type"
  }

  measure: converters {
    type: number
    sql: COUNT(DISTINCT IF(${TABLE}.transaction_id IS NOT NULL, ${TABLE}.context_id, NULL)) ;;
    description: "Count of unique visitor_ids on page views that are labeled with 'Package Purchase' interaction type. QP fields: transaction_id, context_id"
  }

  measure: orders {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.transaction_id ) ;;
    description: "Count of unique transaction_ids. QP fields: transaction_id"
  }

  measure: package_item_min_price {
    type: min
    sql: ${package_item_price_base_value} ;;
    description: "Minimum value of final price of all packages that were displayed, interacted with, or purchased. QP fields: package_item_price_base_value"
  }

  measure: package_item_max_price {
    type: max
    sql: ${package_item_price_base_value} ;;
    description: "Maximum value of final price of all packages that were displayed, interacted with, or purchased. QP fields: package_item_price_base_value"
  }

  measure: package_item_average_price {
    type: average
    sql: ${package_item_price_base_value} ;;
    description: "Average value of final price of all packages that were displayed, interacted with, or purchased. QP fields: package_item_price_base_value"
  }

  measure: distinct_package_item_ids {
    type: number
    sql: COUNT(DISTINCT ${package_item_id}) ;;
    description: "Count of unique package item ids that were displayed, interacted with, or purchased. QP fields: package_item_id"
  }

  measure: package_item_purchased_value {
    type: number
    sql: SUM(IF(${TABLE}.transaction_id IS NOT NULL, ${package_subtotal_base_value}, 0));;
    description: "Final price of all packages that were purchased. QP fields: transaction_id, package_item_price_base_value"
  }
}