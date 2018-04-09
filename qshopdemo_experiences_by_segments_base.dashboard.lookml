#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_experience_by_segments_base
  title: "qshopdemo - post-experience RPV, by segments"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Date"
      type: date_filter
      default_value: 30 days ago for 30 days

    - name: segment_name
      title: "Segment name"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_segment_v01.segment_name

    - name: experience_name
      title: "Experience seen name"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_experience_v01.experience_name


  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      title_text: "Revenue per visitor by experiences and segments"
      subtitle_text: ""
      body_text: "This report presents summary of RPV values by experience name, filtered by segments. Click on 'Visitors, Revenue Per Visitor, Conversion Rate by experience' table headers to change sorting order. Use 'Filters' at the top of the dashboard to narrow down data with segment or experience names. "

    - name: revenue_single_value
      width: 40
      height: 20
      top: 15
      left: 0
      title: ""
      type: single_value
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      measures: [qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total]
      dynamic_fields:
      - table_calculation: transaction_total
        label: Transaction total
        expression: "${qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total}"
        value_format:
        value_format_name: decimal_0
      row_total: right
      query_timezone: Europe/London
      single_value_title: Total revenue
      hidden_fields: [qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total]
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name


    - name: visitors_single_value
      width: 40
      height: 20
      top: 15
      left: 40
      title: ""
      type: single_value
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      measures: [qshopdemo_qp_bi_view_v01.view_visitors]
      query_timezone: Europe/London
      single_value_title: Distinct visitors
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name

    - name: rpv_single_value
      width: 40
      height: 20
      top: 15
      left: 80
      title: ""
      type: single_value
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      measures: [qshopdemo_qp_bi_transaction_v01.revenue_per_visitor]
      query_timezone: Europe/London
      single_value_title: Revenue per visitor
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name

    - name: experiments_over_time
      width: 120
      height: 50
      top: 35
      left: 0
      title: "Experience delivery over time"
      type: looker_area
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      dimensions: [qshopdemo_qp_bi_experience_v01.time_data_points_week, qshopdemo_qp_bi_experience_v01.experience_name]
      pivots: [qshopdemo_qp_bi_experience_v01.experience_name]
      fill_fields: [qshopdemo_qp_bi_experience_v01.time_data_points_week]
      measures: [qshopdemo_qp_bi_experience_v01.experience_visitors]
      sorts: [qshopdemo_qp_bi_experience_v01.time_data_points_week desc, qshopdemo_qp_bi_experience_v01.experience_name]
      row_total: right
      query_timezone: Europe/London
      stacking: normal
      show_view_names: false
      x_axis_gridlines: false
      y_axis_gridlines: false
      x_axis_scale: time
      table_theme: editable
      truncate_column_names: false
      x_axis_label: 'Experience delivery week (start date of a week)'
      listen:
        date_filter: qshopdemo_qp_bi_experience_v01.time_data_points_week
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name

    - name: top_segments
      width: 120
      height: 50
      top: 85
      left: 0
      title: "Top 10 segments by transaction total value"
      type: looker_bar
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      dimensions: [qshopdemo_qp_bi_segment_v01.segment_name]
      measures: [qshopdemo_qp_bi_segment_v01.transaction_total, qshopdemo_qp_bi_segment_v01.segment_visitors]
      sorts: [qshopdemo_qp_bi_segment_v01.transaction_total desc]
      query_timezone: Europe/London
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      limit_displayed_rows: true
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: '10'
      y_axis_combined: false
      series_types:
        qshopdemo_qp_bi_segment_v01.transaction_total: line
        qshopdemo_qp_bi_segment_v01.segment_visitors: column
      series_colors:
        qshopdemo_qp_bi_segment_v01.segment_visitors: "#4c4f53"
        qshopdemo_qp_bi_segment_v01.transaction_total: "#47b28d"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name

    - name: experiences_rpv_visitors
      width: 120
      height: 50
      top: 135
      left: 0
      title: "Visitors, Revenue Per Visitor, Conversion Rate by experience"
      type: table
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      dimensions: [qshopdemo_qp_bi_experience_v01.experience_name, qshopdemo_qp_bi_experience_v01.is_control]
      pivots: [qshopdemo_qp_bi_experience_v01.is_control]
      measures: [qshopdemo_qp_bi_experience_v01.revenue_per_visitor, qshopdemo_qp_bi_experience_v01.experience_visitors, qshopdemo_qp_bi_experience_v01.visitor_conversion_rate]
      sorts: [qshopdemo_qp_bi_experience_v01.is_control 0, qshopdemo_qp_bi_experience_v01.experience_visitors desc 2]
      limit: '500'
      row_total: right
      query_timezone: Europe/London
      show_view_names: false
      show_row_numbers: false
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: gray
      limit_displayed_rows: false
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
        date_filter: qshopdemo_qp_bi_experience_v01.time_data_points_date
        segment_name: qshopdemo_qp_bi_segment_v01.segment_name
        experience_name: qshopdemo_qp_bi_experience_v01.experience_name
