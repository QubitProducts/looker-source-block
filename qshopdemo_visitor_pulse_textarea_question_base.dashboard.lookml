#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_visitor_pulse_textarea_question_base
  title: "qshopdemo - Visitor Pulse Report - Textarea Question"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Date"
      type: date_filter
      default_value: 90 days ago for 90 days

    - name: question_text
      title: "Question Text"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.question_text

    - name: survey
      title: "Survey"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.survey_id

    - name: device_type
      title: "Device type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_session_v01.device_type

    - name: app_name
      title: "Browser type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_session_v01.app_name

    - name: os_name
      title: "OS name"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_session_v01.os_name

    - name: page_type
      title: "Page type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.page_type

    - name: page_subtype
      title: "Page subtype"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.page_subtype

    - name: referrer_type
      title: "Referrer type"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_entrance_v01.referrer_type

    - name: country
      title: "Country"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_session_v01.ip_location_country

    - name: user_survey_answer_1
      title: "User Survey Answer 1"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_1

    - name: user_survey_answer_2
      title: "User Survey Answer 2"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_2

    - name: user_survey_answer_3
      title: "User Survey Answer 3"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      field: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_3

  elements:

    - name: description
      width: 120
      height: 15
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      title_text: "Visitor Pulse - Textarea Question"
      subtitle_text: ""
      body_text: "This report shows details of a selected textarea question (see FILTERS tab). Full survey response details can be found at the bottom of the dashboard. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: survey_visitors_textarea
      width: 20
      height: 40
      top: 15
      left: 0
      title: 'Visitors'
      note:
        text: 'Textarea question visitors'
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: single_value
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.survey_visitors]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_textarea: '-NULL'
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: textarea
      limit: 500
      column_limit: 50
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      listen:
        date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date
        question_text: qshopdemo_qp_bi_visitor_pulse_v01.question_text
        survey: qshopdemo_qp_bi_visitor_pulse_v01.survey_id
        device_type: qshopdemo_qp_bi_session_v01.device_type
        app_name: qshopdemo_qp_bi_session_v01.app_name
        os_name: qshopdemo_qp_bi_session_v01.os_name
        page_type: qshopdemo_qp_bi_visitor_pulse_v01.page_type
        page_subtype: qshopdemo_qp_bi_visitor_pulse_v01.page_subtype
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        country: qshopdemo_qp_bi_session_v01.ip_location_country
        user_survey_answer_1: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_1
        user_survey_answer_2: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_2
        user_survey_answer_3: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_3

    - name: total_answers_textarea
      width: 20
      height: 40
      top: 55
      left: 0
      title: 'Total Answers'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: single_value
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.total_answers]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_textarea: '-NULL'
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: textarea
      limit: 500
      column_limit: 50
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      listen:
        date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date
        question_text: qshopdemo_qp_bi_visitor_pulse_v01.question_text
        survey: qshopdemo_qp_bi_visitor_pulse_v01.survey_id
        device_type: qshopdemo_qp_bi_session_v01.device_type
        app_name: qshopdemo_qp_bi_session_v01.app_name
        os_name: qshopdemo_qp_bi_session_v01.os_name
        page_type: qshopdemo_qp_bi_visitor_pulse_v01.page_type
        page_subtype: qshopdemo_qp_bi_visitor_pulse_v01.page_subtype
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        country: qshopdemo_qp_bi_session_v01.ip_location_country
        user_survey_answer_1: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_1
        user_survey_answer_2: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_2
        user_survey_answer_3: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_3

    - name: textarea_responses
      width: 100
      height: 80
      top: 15
      left: 20
      title: 'Textarea last 100 responses'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: table
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.answer_textarea, qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_time]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_textarea: '-NULL'
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: textarea
      sorts: [qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_time desc]
      limit: 100
      column_limit: 50
      total: true
      row_total: right
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
      stacking: normal
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
      show_totals_labels: true
      show_silhouette: false
      totals_color: "#808080"
      value_labels: labels
      label_type: labPer
      show_null_points: true
      point_style: none
      interpolation: linear
      series_types: {}
      hidden_series: []
      series_labels:
        qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_time: Response time
      listen:
        date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date
        question_text: qshopdemo_qp_bi_visitor_pulse_v01.question_text
        survey: qshopdemo_qp_bi_visitor_pulse_v01.survey_id
        device_type: qshopdemo_qp_bi_session_v01.device_type
        app_name: qshopdemo_qp_bi_session_v01.app_name
        os_name: qshopdemo_qp_bi_session_v01.os_name
        page_type: qshopdemo_qp_bi_visitor_pulse_v01.page_type
        page_subtype: qshopdemo_qp_bi_visitor_pulse_v01.page_subtype
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        country: qshopdemo_qp_bi_session_v01.ip_location_country
        user_survey_answer_1: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_1
        user_survey_answer_2: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_2
        user_survey_answer_3: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_3

    - name: full_detail
      width: 120
      height: 50
      top: 95
      left: 0
      title: 'Survey full detail including score, radio, checkbox and textarea questions - last 500 answers.'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: table
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.survey_id, qshopdemo_qp_bi_visitor_pulse_v01.context_id,
        qshopdemo_qp_bi_visitor_pulse_v01.context_view_number, qshopdemo_qp_bi_visitor_pulse_v01.question_type,
        qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date, qshopdemo_qp_bi_visitor_pulse_v01.question_text,
        qshopdemo_qp_bi_visitor_pulse_v01.answer, qshopdemo_qp_bi_visitor_pulse_v01.question_freetext,
        qshopdemo_qp_bi_visitor_pulse_v01.meta_url]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer: "-NULL"
        qshopdemo_qp_bi_visitor_pulse_v01.question_text: ''
        qshopdemo_qp_bi_visitor_pulse_v01.survey_id: ''
        qshopdemo_qp_bi_session_v01.device_type: ''
      sorts: [qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_time desc, qshopdemo_qp_bi_visitor_pulse_v01.survey_id
        desc, qshopdemo_qp_bi_visitor_pulse_v01.context_id desc]
      limit: 500
      column_limit: 50
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
      stacking: normal
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
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
      series_types: {}
      font_size: ''
      label_value_format: ''
      column_spacing_ratio: 0
      column_group_spacing_ratio: 0.2
      series_labels:
      qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_time: Response time
      listen:
        date_filter: qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_date
        survey: qshopdemo_qp_bi_visitor_pulse_v01.survey_id
        device_type: qshopdemo_qp_bi_session_v01.device_type
        app_name: qshopdemo_qp_bi_session_v01.app_name
        os_name: qshopdemo_qp_bi_session_v01.os_name
        page_type: qshopdemo_qp_bi_visitor_pulse_v01.page_type
        page_subtype: qshopdemo_qp_bi_visitor_pulse_v01.page_subtype
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        country: qshopdemo_qp_bi_session_v01.ip_location_country
        user_survey_answer_1: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_1
        user_survey_answer_2: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_2
        user_survey_answer_3: qshopdemo_qp_bi_visitor_pulse_v01.user_survey_answer_3
