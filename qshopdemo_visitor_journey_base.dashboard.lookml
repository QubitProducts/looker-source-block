#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_visitor_journey_base
  title: "qshopdemo - Visitor Journey"
  layout: static
  extension: required
  tile_size: 10
  width: 1200

  filters:

    - name: date
      title: "Date"
      type: date_filter
      default_value: 30 days ago for 30 days

  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      explore: qshopdemo_qp_bi_view_v01
      title_text: "Visitor Journey Report"
      subtitle_text: ""
      body_text: "This visualisation displays visitors' journeys, where visitors start on the top bar and successive pageviews are displayed as lower bars. Hover over any chart, click the three dots icon in top right corner and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: entrances_by_referrer_type
      width: 60
      height: 30
      top: 15
      left: 0
      title: "Entrances by Referrer Type"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_pie
      fields: [qshopdemo_qp_bi_entrance_v01.referrer_type, qshopdemo_qp_bi_entrance_v01.entrances]
      sorts: [qshopdemo_qp_bi_entrance_v01.entrances desc]
      query_timezone: Europe/London
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      inner_radius: 50
      value_labels: legend
      label_type: labPer
      listen:
            date: qshopdemo_qp_bi_view_v01.time_data_points_date

    - name: entrances_by_device_type
      width: 60
      height: 30
      top: 15
      left: 60
      title: "Entrances by Device Type"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_pie
      fields: [qshopdemo_qp_bi_entrance_v01.entrances, qshopdemo_qp_bi_session_v01.device_type]
      sorts: [qshopdemo_qp_bi_entrance_v01.entrances desc]
      query_timezone: Europe/London
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
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
      inner_radius: 50
      value_labels: legend
      label_type: labPer
      listen:
            date: qshopdemo_qp_bi_view_v01.time_data_points_date

    - name: views_in_entrance
      width: 120
      height: 50
      top: 45
      left: 0
      title: "Number of entrances by view in entrance and page type. First 10 views in entrance displayed"
      note:
        text: 'Click on colour legend element to hide or show series'
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_bar
      fields: [qshopdemo_qp_bi_view_v01.context_entrance_view_number, qshopdemo_qp_bi_view_v01.page_type,
        qshopdemo_qp_bi_entrance_v01.entrances]
      pivots: [qshopdemo_qp_bi_view_v01.page_type]
      filters:
        qshopdemo_qp_bi_view_v01.context_entrance_view_number: "[1, 10]"
      sorts: [qshopdemo_qp_bi_view_v01.context_entrance_view_number, qshopdemo_qp_bi_view_v01.page_type
      0]      
      query_timezone: Europe/London
      stacking: normal
      show_value_labels: true
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      limit_displayed_rows: true
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
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_ignored_fields: []
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      barColors: ['palette: Default']
      smoothedBars: false
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      labelColor: "#FFF"
      series_types: {}
      listen:
            date: qshopdemo_qp_bi_view_v01.time_data_points_date

    - name: exit_rates
      width: 120
      height: 35
      top: 95
      left: 0
      title: "Exit rates by view in entrance and page type. First 10 views in entrance displayed"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_view_v01.context_entrance_view_number, qshopdemo_qp_bi_view_v01.page_type,
        qshopdemo_qp_bi_view_v01.exit_rate]
      pivots: [qshopdemo_qp_bi_view_v01.context_entrance_view_number]
      filters:
        qshopdemo_qp_bi_view_v01.context_entrance_view_number: "[1, 10]"
      sorts: [qshopdemo_qp_bi_view_v01.page_type 0, qshopdemo_qp_bi_view_v01.context_entrance_view_number]
      total: true
      row_total: right
      query_timezone: Europe/London
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
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
      show_null_points: true
      point_style: circle_outline
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
      value_labels: legend
      label_type: labPer
      series_types: {}
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
      hidden_series: []
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF", "#4FBC89"]},
          bold: false, italic: false, strikethrough: false}]
      listen:
            date: qshopdemo_qp_bi_view_v01.time_data_points_date

    - name: kpis
      width: 120
      height: 30
      top: 130
      left: 0
      title: "Key figures by country"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_session_v01.ip_location_country, qshopdemo_qp_bi_entrance_v01.entrances,
        qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate, qshopdemo_qp_bi_transaction_v01.average_order_value,
        qshopdemo_qp_bi_view_v01.entrance_bounce_rate]
      sorts: [qshopdemo_qp_bi_entrance_v01.entrances desc]
      #limit: 10
      column_limit: 50
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
            date: qshopdemo_qp_bi_view_v01.time_data_points_date
