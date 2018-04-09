#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_attribution_base
  title: "qshopdemo - Attribution Report"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Order date"
      type: date_filter
      default_value: 90 days ago for 90 days

  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      title_text: "Attribution Report"
      subtitle_text: ""
      body_text: "This report compares transaction value calculated using different attribution models, as well as shows performance of purchase cycle groups, touchpoints, top campaigns and keywords. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: referrer_overview
      width: 120
      height: 40
      top: 15
      left: 0
      title: "Attribution Dashboard - Referrer Overview"
      note:
        text: "This report shows the highest-level findings of attribution, showing how much value each traffic source generated for each type of attribution method."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: looker_column
      fields: [qshopdemo_qp_bi_attribution_v01.true_referrer_type,
        qshopdemo_qp_bi_attribution_v01.first_click_value,
        qshopdemo_qp_bi_attribution_v01.last_click_value,
        qshopdemo_qp_bi_attribution_v01.behavioural_value]
      filters:
        qshopdemo_qp_bi_attribution_v01.true_referrer_type: "-NULL"
      sorts: [qshopdemo_qp_bi_attribution_v01.first_click_value
          desc]
      query_timezone: Europe/London
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      hidden_fields:
      series_labels:
        first_click_value_decimal_0: First Click Value
        last_click_value_decimal_0: Last Click Value
        behavioural_value_decimal_0: Behavioural Value
      y_axes: [{label: Revenue, maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: first_click_value_decimal_0,
              name: First Click Value}, {id: last_click_value_decimal_0, name: Last Click
                Value}, {id: behavioural_value_decimal_0, name: Behavioural Value}]}]
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date

    - name: totals
      width: 120
      height: 30
      top: 55
      left: 0
      title: "Totals"
      note:
        text: "Totals per referrer."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: table
      fields: [qshopdemo_qp_bi_attribution_v01.true_referrer_type,
        qshopdemo_qp_bi_attribution_v01.first_click_value,
        qshopdemo_qp_bi_attribution_v01.last_click_value,
        qshopdemo_qp_bi_attribution_v01.behavioural_value,
        qshopdemo_qp_bi_attribution_v01.entry_count, qshopdemo_qp_bi_attribution_v01.attribution_order_count]
      filters:
        qshopdemo_qp_bi_attribution_v01.true_referrer_type: "-NULL"
      sorts: [qshopdemo_qp_bi_attribution_v01.first_click_value
          desc]
      total: true
      query_timezone: Europe/London
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      hidden_fields:
      series_labels:
        first_click_value_decimal_0: First Click Value
        last_click_value_decimal_0: Last Click Value
        behavioural_value_decimal_0: Behavioural Value
      y_axes: [{label: Revenue, maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: first_click_value_decimal_0,
              name: First Click Value}, {id: last_click_value_decimal_0, name: Last Click
                Value}, {id: behavioural_value_decimal_0, name: Behavioural Value}]}]
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date

    - name: repeat_purchasers_by_channel
      width: 60
      height: 50
      top: 85
      left: 0
      title: "Repeat Purchasers by Channel"
      note:
        text: "This shows which traffic sources  drive value on the first and subsequent purchases. This highlights the difference in traffic source usage for new acquisitions vs repeat purchasers."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: looker_column
      fields: [qshopdemo_qp_bi_attribution_v01.true_referrer_type,
        qshopdemo_qp_bi_attribution_v01.behavioural_value,
        qshopdemo_qp_bi_attribution_v01.purchase_cycle_group]
      pivots: [qshopdemo_qp_bi_attribution_v01.true_referrer_type]
      filters:
        qshopdemo_qp_bi_attribution_v01.true_referrer_type: "-NULL"
      sorts: [qshopdemo_qp_bi_attribution_v01.behavioural_value
          desc 0, qshopdemo_qp_bi_attribution_v01.true_referrer_type]
      total: true
      query_timezone: Europe/London
      stacking: percent
      show_value_labels: true
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
      series_labels:
        first_click_value_decimal_0: First Click Value
        last_click_value_decimal_0: Last Click Value
        behavioural_value_decimal_0: Behavioural Value
      y_axes: [{label: Percent share in purchase cycle group, maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
          series: [{id: DIRECT, name: DIRECT}, {id: DISPLAY, name: DISPLAY}, {id: EMAIL,
              name: EMAIL}, {id: OTHER, name: OTHER}, {id: REFERRAL, name: REFERRAL},
            {id: SEM, name: SEM}, {id: SEO, name: SEO}, {id: SOCIAL, name: SOCIAL}, {
              id: "∅", name: "∅"}]}]
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date

    - name: traffic_source_touchpoints
      width: 60
      height: 50
      top: 85
      left: 60
      title: "Traffic Source Touchpoints"
      note:
        text: "This shows how different channels generate their behavioural value on different touchpoints (the first, middle (assist) or last touchpoint before sale).  Sometimes channels convert with one touchpoint - these are shown too."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: looker_bar
      fields: [qshopdemo_qp_bi_attribution_v01.true_referrer_type,
        qshopdemo_qp_bi_attribution_v01.entry_count, qshopdemo_qp_bi_attribution_v01.touchpoint]
      pivots: [qshopdemo_qp_bi_attribution_v01.touchpoint]
      filters:
        qshopdemo_qp_bi_attribution_v01.true_referrer_type: "-NULL"
      sorts: [qshopdemo_qp_bi_attribution_v01.true_referrer_type,
        qshopdemo_qp_bi_attribution_v01.touchpoint]
      limit: 500
      column_limit: 50
      query_timezone: Europe/London
      stacking: percent
      show_value_labels: true
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields:
      series_labels:
        first_click_value_decimal_0: First Click Value
        last_click_value_decimal_0: Last Click Value
        behavioural_value_decimal_0: Behavioural Value
      y_axes: [{label: Percent share in referrer type, maxValue: !!null '', minValue: !!null '',
          orientation: bottom, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: !!null '',
          series: [{id: Assist, name: Assist}, {id: First, name: First}, {id: Last, name: Last},
            {id: Single Entry, name: Single Entry}]}]
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date

    - name: top_20_campaigns
      width: 120
      height: 30
      top: 135
      left: 0
      title: "Attribution - Top 20 Campaigns"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: table
      fields: [qshopdemo_qp_bi_attribution_v01.referrer_campaign,
        qshopdemo_qp_bi_attribution_v01.entry_count, qshopdemo_qp_bi_attribution_v01.attribution_order_count,
        qshopdemo_qp_bi_attribution_v01.behavioural_value,
        qshopdemo_qp_bi_attribution_v01.first_click_value,
        qshopdemo_qp_bi_attribution_v01.last_click_value]
      sorts: [qshopdemo_qp_bi_attribution_v01.entry_count
          desc]
      limit: 20
      query_timezone: Europe/London
      show_view_names: true
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date

    - name: top_20_referrer_keywords
      width: 120
      height: 30
      top: 165
      left: 0
      title: "Attribution - Top 20 Referrer Keywords"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: table
      fields: [qshopdemo_qp_bi_attribution_v01.referrer_keywords,
        qshopdemo_qp_bi_attribution_v01.entry_count, qshopdemo_qp_bi_attribution_v01.attribution_order_count,
        qshopdemo_qp_bi_attribution_v01.behavioural_value,
        qshopdemo_qp_bi_attribution_v01.first_click_value,
        qshopdemo_qp_bi_attribution_v01.last_click_value]
      sorts: [qshopdemo_qp_bi_attribution_v01.entry_count
          desc]
      limit: 20
      query_timezone: Europe/London
      show_view_names: true
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date
        
    - name: full_detail
      width: 120
      height: 40
      top: 195
      left: 0
      title: "Attribution Full Detail - most recent orders, last 100 entries"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_attribution_v01
      type: table
      fields: [qshopdemo_qp_bi_attribution_v01.order_ids_in_purchase_cycle, qshopdemo_qp_bi_attribution_v01.behavioural_value,
              qshopdemo_qp_bi_attribution_v01.even_click_value, qshopdemo_qp_bi_attribution_v01.first_click_value,
              qshopdemo_qp_bi_attribution_v01.last_click_value, qshopdemo_qp_bi_attribution_v01.ranked_purchase_number_int,
              qshopdemo_qp_bi_attribution_v01.ranked_entry_number, qshopdemo_qp_bi_attribution_v01.entry_timestamp_time,
              qshopdemo_qp_bi_attribution_v01.true_referrer_type, qshopdemo_qp_bi_attribution_v01.referrer_domain,
              qshopdemo_qp_bi_attribution_v01.referrer_search_query, qshopdemo_qp_bi_attribution_v01.referrer_content,
              qshopdemo_qp_bi_attribution_v01.referrer_campaign, qshopdemo_qp_bi_attribution_v01.referrer_keywords,
              qshopdemo_qp_bi_attribution_v01.referrer_network, qshopdemo_qp_bi_attribution_v01.referrer_ad_group]
      sorts: [qshopdemo_qp_bi_attribution_v01.order_ids_in_purchase_cycle desc, qshopdemo_qp_bi_attribution_v01.ranked_entry_number]  
      limit: 100
      column_limit: 50
      show_view_names: true
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      listen:
        date_filter: qshopdemo_qp_bi_attribution_v01.purchase_timestamp_date
