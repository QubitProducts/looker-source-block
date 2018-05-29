#File uploaded: Mon Apr 09 14:05:48 GMT 2018
- dashboard: qshopdemo_visitor_pulse_base
  title: "qshopdemo - Visitor Pulse Overview"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

  - name: date_filter
    title: "Date"
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
    explore: qshopdemo_qp_bi_visitor_pulse_v01
    title_text: "Visitor Pulse Report"
    subtitle_text: "Click on a question name to deep dive into question details"
    body_text: "This report shows an overview of surveys that were live during specified date range. Click on a question name to go into a more detailed breakdown. Click on 3 dots (...) or use Explore From Here to create custom analysis"

  - name: overview
    width: 120
    height: 50
    top: 15
    left: 0
    title: 'Survey questions overview'
    model: qshopdemo_livetap
    explore: qshopdemo_qp_bi_visitor_pulse_v01
    type: table
    fields: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id, qshopdemo_qp_bi_visitor_pulse_v01.question_text,
      qshopdemo_qp_bi_visitor_pulse_v01.question_type, qshopdemo_qp_bi_visitor_pulse_v01.question_order,
      qshopdemo_qp_bi_visitor_pulse_v01.last_answer_date, qshopdemo_qp_bi_visitor_pulse_v01.total_answered_questions]
    filters:
      qshopdemo_qp_bi_visitor_pulse_v01.answer: "-NULL"
      qshopdemo_qp_bi_visitor_pulse_v01.question_text: ''
      qshopdemo_qp_bi_visitor_pulse_v01.survey_id: ''
      qshopdemo_qp_bi_session_v01.device_type: ''
      #qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date: 90 days
    sorts: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id desc, qshopdemo_qp_bi_visitor_pulse_v01.question_order
        asc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields: [qshopdemo_qp_bi_visitor_pulse_v01.question_order]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: true
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
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    font_size: ''
    label_value_format: ''
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0.2
    series_labels:
    qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date: Last response date
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF", "#4FBC89"]},
        bold: false, italic: false, strikethrough: false}]
    listen:
      date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date

  - name: survey_visitors_over_time
    title: 'Survey visitors over time (survey ID breakdown)'
    width: 120
    height: 40
    top: 64
    left: 0
    model: qshopdemo_livetap
    explore: qshopdemo_qp_bi_visitor_pulse_v01
    type: looker_line
    fields: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id, qshopdemo_qp_bi_visitor_pulse_v01.survey_visitors,
      qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week]
    pivots: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id]
    fill_fields: [qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week]
    filters:
      qshopdemo_qp_bi_visitor_pulse_v01.answer: "-NULL"
      qshopdemo_qp_bi_visitor_pulse_v01.question_text: ''
      qshopdemo_qp_bi_visitor_pulse_v01.survey_id: ''
      qshopdemo_qp_bi_session_v01.device_type: ''
    sorts: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id desc, qshopdemo_qp_bi_visitor_pulse_v01.survey_visitors
      desc 0]
    limit: 500
    column_limit: 50
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
    point_style: circle_outline
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: true
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
    ordering: none
    show_null_labels: false
    series_types: {}
    font_size: ''
    label_value_format: ''
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0.2
    hidden_series: []
    x_axis_label: Week
    listen:
      date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date
