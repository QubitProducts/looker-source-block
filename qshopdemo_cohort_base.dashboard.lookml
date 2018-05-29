#File uploaded: Mon Apr 09 14:05:48 GMT 2018
- dashboard: qshopdemo_cohort_base
  title: "qshopdemo - Cohort Report"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "First entry date"
      type: date_filter
      default_value: 90 days ago for 90 days

    - name: referrer_type
      title: "Referrer type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_entrance_v01.referrer_type

    - name: device_type
      title: "Device type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_session_v01.device_type


  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      title_text: "Cohort Report"
      subtitle_text: ""
      body_text: "This report presents cohorts of visitors based on the week of their first entrance on site. Analysis is centred around number of unique converters. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: cohort_heatmap
      width: 120
      height: 40
      top: 15
      left: 0
      title: "Converters progression by first entrance date cohorts and weeks after first entrance."
      note:
        text: "Heatmap shows number of converters for each cohort, in the same week as first entrance, one week after first entrance, etc."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_view_v01.visitor_first_entry_week,
        qshopdemo_qp_bi_transaction_v01.weeks_since_first_entry,
        qshopdemo_qp_bi_transaction_v01.converters]
      pivots: [qshopdemo_qp_bi_transaction_v01.weeks_since_first_entry]
      fill_fields: [qshopdemo_qp_bi_view_v01.visitor_first_entry_week]
      filters:
        qshopdemo_qp_bi_transaction_v01.weeks_since_first_entry: ">=0"
      sorts: [qshopdemo_qp_bi_view_v01.visitor_first_entry_week
          desc, qshopdemo_qp_bi_transaction_v01.weeks_since_first_entry]
      query_timezone: Europe/London
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
      enable_conditional_formatting: true
      conditional_formatting_ignored_fields: [qshopdemo_qp_bi_transaction_v01.weeks_since_first_entry]
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF", "#4FBC89"]},
          bold: false, italic: false, strikethrough: false}]
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.visitor_first_entry_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type

    - name: converters_referrer_device
      width: 60
      height: 50
      top: 55
      left: 0
      title: "Count converters, by referrer type and device type"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_column
      fields: [qshopdemo_qp_bi_entrance_v01.referrer_type,
        qshopdemo_qp_bi_session_v01.device_type, qshopdemo_qp_bi_transaction_v01.converters]
      pivots: [qshopdemo_qp_bi_session_v01.device_type]
      sorts: [qshopdemo_qp_bi_transaction_v01.converters
          desc 0, qshopdemo_qp_bi_session_v01.device_type]
      query_timezone: Europe/London
      stacking: normal
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: false
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
      show_totals_labels: true
      show_silhouette: false
      totals_color: "#808080"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.visitor_first_entry_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type

    - name: converters_referrer_label
      width: 60
      height: 50
      top: 55
      left: 60
      title: "Top 10 referrer labels, by number of converters"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_bar
      fields: [qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_entrance_v01.referrer_label]
      sorts: [qshopdemo_qp_bi_transaction_v01.converters
          desc]
      limit: 10
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
      series_types: {}
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.visitor_first_entry_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type
