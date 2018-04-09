#File uploaded: Mon Apr 09 14:05:48 GMT 2018
- dashboard: qshopdemo_trading_base
  title: "qshopdemo - Trading Report"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Date"
      type: date_filter
      default_value: 90 days ago for 90 days

    - name: device_type
      title: "Device type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_session_v01.device_type

    - name: country_name
      title: "Country name"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_session_v01.ip_location_country

  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      title_text: "Trading Report"
      subtitle_text: ""
      body_text: "This report shows sitewide key performance indicators (absolute values and ratios) as well as breaks the data down by country and device type. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: kpis_table
      width: 120
      height: 10
      top: 15
      left: 0
      title: ""
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_view_v01.view_visitors, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.transactions, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor]
      sorts: [qshopdemo_qp_bi_view_v01.view_visitors desc]
      column_limit: 50
      query_timezone: Europe/London
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      series_types: {}
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
              "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false}]
      series_labels:
        qshopdemo_qp_bi_view_v01.view_visitors: Visitors
        qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate: Conversion
          Rate
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: Transaction
          Total
        qshopdemo_qp_bi_transaction_v01.average_order_value: AOV
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter: RPC
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor: RPV
      listen:
          date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
          device_type: qshopdemo_qp_bi_session_v01.device_type
          country_name: qshopdemo_qp_bi_session_v01.ip_location_country

    - name: map
      width: 120
      height: 40
      top: 25
      left: 0
      title: "Converters geographic distribution"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_geo_choropleth
      fields: [qshopdemo_qp_bi_session_v01.ip_location_country_code,
        qshopdemo_qp_bi_transaction_v01.converters]
      sorts: [qshopdemo_qp_bi_transaction_v01.converters
          desc]
      query_timezone: Europe/London
      map: world
      map_projection: kavrayskiy7
      show_view_names: true
      quantize_colors: false
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_gridlines_empty: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: fit_data
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_legend: true
      quantize_map_value_colors: false
      reverse_map_value_colors: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
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
      series_types: {}
      colors: ["#E9F6F1", "#47b28d"]
      empty_color: "#e2e2e2"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        device_type: qshopdemo_qp_bi_session_v01.device_type
        country_name: qshopdemo_qp_bi_session_v01.ip_location_country

    - name: kpis_over_time
      title: "KPIs over time"
      note:
        text: "Use legend below the chart to hide / unhide series."
        state: expanded
        display: above
      width: 120
      height: 40
      top: 65
      left: 0
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_area
      fields: [qshopdemo_qp_bi_view_v01.view_visitors, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.transactions, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
        qshopdemo_qp_bi_view_v01.time_data_points_date]
      fill_fields: [qshopdemo_qp_bi_view_v01.time_data_points_date]
      sorts: [qshopdemo_qp_bi_view_v01.time_data_points_date
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
      x_axis_scale: time
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_types: {}
      hidden_series: [qshopdemo_qp_bi_view_v01.view_visitors,
        qshopdemo_qp_bi_transaction_v01.transactions, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor]
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: false, showValues: false, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_view_v01.view_visitors,
              name: Views Unique Visitors}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
              name: Transactions Revenue per Visitor}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
              name: Transactions Revenue per Converter}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
              name: Transactions Sum of Transaction Total}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.average_order_value,
              name: Transactions Average Order Value}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
              name: Transactions Visitor Conversion Rate}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.converters,
              name: Transactions Converters}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: false, showValues: false,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: !!null '', series: [{id: qshopdemo_qp_bi_transaction_v01.transactions,
              name: Transactions Transactions}]}]
      hide_legend: false
      x_axis_label: Date
      x_axis_datetime_label: "%d %b %Y"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        device_type: qshopdemo_qp_bi_session_v01.device_type
        country_name: qshopdemo_qp_bi_session_v01.ip_location_country

    - name: device_full_detail
      width: 120
      height: 20
      top: 105
      left: 0
      title: "KPIs by device type"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_view_v01.view_visitors, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.transactions, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
        qshopdemo_qp_bi_session_v01.device_type]
      sorts: [qshopdemo_qp_bi_view_v01.view_visitors desc]
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
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        device_type: qshopdemo_qp_bi_session_v01.device_type
        country_name: qshopdemo_qp_bi_session_v01.ip_location_country

    - name: country_full_detail
      width: 120
      height: 40
      top: 125
      left: 0
      title: "KPIs by country name"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_session_v01.ip_location_country,
        qshopdemo_qp_bi_view_v01.view_visitors, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.transactions, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor]
      sorts: [qshopdemo_qp_bi_view_v01.view_visitors desc]
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
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        device_type: qshopdemo_qp_bi_session_v01.device_type
        country_name: qshopdemo_qp_bi_session_v01.ip_location_country
