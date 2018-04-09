#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_visitor_pulse_checkbox_question_base
  title: "qshopdemo - Visitor Pulse Report - Checkbox question"
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
      title: "Question text"
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
      title_text: "Visitor Pulse - Checkbox Question"
      subtitle_text: ""
      body_text: "This report shows details of a selected checkbox question (see FILTERS tab). Full survey response details can be found at the bottom of the dashboard. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: survey_visitors_radio_checkbox
      width: 20
      height: 45
      top: 15
      left: 0
      title: 'Visitors'
      note:
        text: 'Radio/ Checkbox question visitors'
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: single_value
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.survey_visitors]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_radio_checkbox: "-NULL"
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: checkbox
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

    - name: total_answers_radio_checkbox
      width: 20
      height: 45
      top: 60
      left: 0
      title: 'Total Answers'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: single_value
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.total_answers]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_radio_checkbox:  "-NULL"
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: checkbox
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

    - name: radio_checkbox_frequency
      width: 100
      height: 45
      top: 15
      left: 20
      title: 'Radio / Checkbox answers frequency'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: looker_pie
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.answer_radio_checkbox, qshopdemo_qp_bi_visitor_pulse_v01.total_answered_questions]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.answer_radio_checkbox:  "-NULL"
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: checkbox
      sorts: [qshopdemo_qp_bi_visitor_pulse_v01.answer_radio_checkbox 0]
      limit: 500
      column_limit: 50
      total: true
      row_total: right
      value_labels: labels
      label_type: labPer
      show_view_names: false
      show_row_numbers: false
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
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: true
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      hidden_series: []
      series_labels:
        qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week: Week
        qshopdemo_qp_bi_visitor_pulse_v01.total_answered_questions: responses
      inner_radius: 40
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

    - name: checkbox_over_time
      width: 100
      height: 45
      top: 60
      left: 20
      title: 'Checkbox responses over time'
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_visitor_pulse_v01
      type: looker_column
      fields: [qshopdemo_qp_bi_visitor_pulse_v01.question_order, qshopdemo_qp_bi_visitor_pulse_v01.total_answered_questions,
        qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week]
      pivots: [qshopdemo_qp_bi_visitor_pulse_v01.question_order]
      fill_fields: [qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week]
      filters:
        qshopdemo_qp_bi_visitor_pulse_v01.question_type: checkbox
      sorts: [qshopdemo_qp_bi_visitor_pulse_v01.question_order, qshopdemo_qp_bi_visitor_pulse_v01.time_data_points_week
          desc]
      limit: 500
      stacking: normal
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
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
      table_theme: editable
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      series_types: {}
      colors: ['palette: Green to Red']
      series_colors: {}
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
      top: 105
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
