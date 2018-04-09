#File uploaded: Mon Apr 09 11:03:11 GMT 2018
- dashboard: qshopdemo_daily_dashboard_trending_base
  title: "qshopdemo - Daily Dashboard - Trending"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Date"
      type: date_filter
      default_value: 30 days ago for 30 days

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

    - name: new_vs_returning
      title: "New vs Returning Visitor"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_view_v01.new_vs_returning

    - name: conversion_number
      title: "Conversion number"
      type: field_filter
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      field: qshopdemo_qp_bi_view_v01.context_conversion_number

  elements:

    - name: description
      width: 120
      height: 20
      top: 0
      left: 0
      type: text
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      title_text: "Daily Dashboard - Trending"
      subtitle_text: ""
      body_text: "Evaluate site performance over time using the timeseries and crosstab below. Use the Date filter to determine the applicable date range. Click on colour legend to show/hide series. Use the Device Type, Returning Visitor Status, and Conversion Number filters to narrow down results. Hover over any chart, click the three dots icon and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: top_selector
      width: 120
      height: 35
      top: 20
      left: 0
      title: "Top Timeseries Selector"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_line
      fields: [qshopdemo_qp_bi_view_v01.time_data_points_date, qshopdemo_qp_bi_session_v01.sessions,
        qshopdemo_qp_bi_entrance_v01.entrances, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_view_v01.session_bounce_rate, qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
        qshopdemo_qp_bi_view_v01.views]
      fill_fields: [qshopdemo_qp_bi_view_v01.time_data_points_date]
      sorts: [qshopdemo_qp_bi_view_v01.time_data_points_date desc]
      column_limit: 50
      dynamic_fields:
      - table_calculation: pageviews_per_session
        label: Pageviews per session
        expression: "${qshopdemo_qp_bi_view_v01.views} / ${qshopdemo_qp_bi_session_v01.sessions}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
      - table_calculation: pageviews_per_entrance
        label: Pageviews per entrance
        expression: |-
          ${qshopdemo_qp_bi_view_v01.views} /
          ${qshopdemo_qp_bi_entrance_v01.entrances}
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
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
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      x_axis_label: Date
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_session_v01.sessions,
              name: Sessions}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_entrance, name: Pageviews per entrance}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.converters,
              name: Converters}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_view_v01.views, name: Views}]}, {label: Revenue,
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
              name: Revenue}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_session, name: Pageviews per session}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
              name: Entrance Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, name: Revenue
                per Visitor}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0%",
          series: [{id: qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
              name: Visitor Conversion Rate}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0", series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
              name: Revenue per Converter}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.session_bounce_rate,
              name: Session Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_entrance_v01.entrances, name: Entrances}]}]
      hidden_series: [qshopdemo_qp_bi_session_v01.sessions, qshopdemo_qp_bi_entrance_v01.entrances,
        qshopdemo_qp_bi_transaction_v01.converters, qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate, qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter, qshopdemo_qp_bi_view_v01.session_bounce_rate,
        qshopdemo_qp_bi_view_v01.entrance_bounce_rate, pageviews_per_session, pageviews_per_entrance]
      series_labels:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: Revenue
      colors: ['palette: Default']
      series_colors:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: "#c23e22"
        qshopdemo_qp_bi_view_v01.views: "#22eba8"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type
        new_vs_returning: qshopdemo_qp_bi_view_v01.new_vs_returning
        conversion_number: qshopdemo_qp_bi_view_v01.context_conversion_number

    - name: middle_selector
      width: 120
      height: 35
      top: 55
      left: 0
      title: "Middle Timeseries Selector"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_line
      fields: [qshopdemo_qp_bi_view_v01.time_data_points_date, qshopdemo_qp_bi_session_v01.sessions,
        qshopdemo_qp_bi_entrance_v01.entrances, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_view_v01.session_bounce_rate, qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
        qshopdemo_qp_bi_view_v01.views]
      fill_fields: [qshopdemo_qp_bi_view_v01.time_data_points_date]
      sorts: [qshopdemo_qp_bi_view_v01.time_data_points_date desc]
      column_limit: 50
      dynamic_fields:
      - table_calculation: pageviews_per_session
        label: Pageviews per session
        expression: "${qshopdemo_qp_bi_view_v01.views} / ${qshopdemo_qp_bi_session_v01.sessions}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
      - table_calculation: pageviews_per_entrance
        label: Pageviews per entrance
        expression: |-
          ${qshopdemo_qp_bi_view_v01.views} /
          ${qshopdemo_qp_bi_entrance_v01.entrances}
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
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
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      x_axis_label: Date
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_session_v01.sessions,
              name: Sessions}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_entrance, name: Pageviews per entrance}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.converters,
              name: Converters}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_view_v01.views, name: Views}]}, {label: Revenue,
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
              name: Revenue}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_session, name: Pageviews per session}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
              name: Entrance Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, name: Revenue
                per Visitor}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0%",
          series: [{id: qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
              name: Visitor Conversion Rate}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0", series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
              name: Revenue per Converter}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.session_bounce_rate,
              name: Session Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_entrance_v01.entrances, name: Entrances}]}]
      hidden_series: [qshopdemo_qp_bi_session_v01.sessions, qshopdemo_qp_bi_entrance_v01.entrances,
        qshopdemo_qp_bi_view_v01.views, qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
        qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate, qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter, qshopdemo_qp_bi_view_v01.session_bounce_rate,
        qshopdemo_qp_bi_view_v01.entrance_bounce_rate, pageviews_per_session, pageviews_per_entrance]
      series_labels:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: Revenue
      colors: ['palette: Default']
      series_colors:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: "#c23e22"
        qshopdemo_qp_bi_view_v01.views: "#22eba8"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type
        new_vs_returning: qshopdemo_qp_bi_view_v01.new_vs_returning
        conversion_number: qshopdemo_qp_bi_view_v01.context_conversion_number

    - name: bottom_selector
      width: 120
      height: 35
      top: 90
      left: 0
      title: "Bottom Timeseries Selector"
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: looker_line
      fields: [qshopdemo_qp_bi_view_v01.time_data_points_date, qshopdemo_qp_bi_session_v01.sessions,
        qshopdemo_qp_bi_entrance_v01.entrances, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_view_v01.session_bounce_rate, qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
        qshopdemo_qp_bi_view_v01.views]
      fill_fields: [qshopdemo_qp_bi_view_v01.time_data_points_date]
      sorts: [qshopdemo_qp_bi_view_v01.time_data_points_date desc]
      column_limit: 50
      dynamic_fields:
      - table_calculation: pageviews_per_session
        label: Pageviews per session
        expression: "${qshopdemo_qp_bi_view_v01.views} / ${qshopdemo_qp_bi_session_v01.sessions}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
      - table_calculation: pageviews_per_entrance
        label: Pageviews per entrance
        expression: |-
          ${qshopdemo_qp_bi_view_v01.views} /
          ${qshopdemo_qp_bi_entrance_v01.entrances}
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
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
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      x_axis_label: Date
      y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_session_v01.sessions,
              name: Sessions}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_entrance, name: Pageviews per entrance}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.converters,
              name: Converters}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_view_v01.views, name: Views}]}, {label: Revenue,
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0", series: [{id: qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total,
              name: Revenue}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: pageviews_per_session, name: Pageviews per session}]}, {label: !!null '',
          maxValue: !!null '', minValue: !!null '', orientation: left, showLabels: true,
          showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
          unpinAxis: false, valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
              name: Entrance Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0",
          series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, name: Revenue
                per Visitor}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0.0%",
          series: [{id: qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
              name: Visitor Conversion Rate}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0", series: [{id: qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
              name: Revenue per Converter}]}, {label: !!null '', maxValue: !!null '',
          minValue: !!null '', orientation: left, showLabels: true, showValues: true,
          tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false,
          valueFormat: "#,##0.0%", series: [{id: qshopdemo_qp_bi_view_v01.session_bounce_rate,
              name: Session Bounce Rate}]}, {label: !!null '', maxValue: !!null '', minValue: !!null '',
          orientation: left, showLabels: true, showValues: true, tickDensity: default,
          tickDensityCustom: 5, type: linear, unpinAxis: false, valueFormat: "#,##0",
          series: [{id: qshopdemo_qp_bi_entrance_v01.entrances, name: Entrances}]}]
      hidden_series: [qshopdemo_qp_bi_session_v01.sessions, qshopdemo_qp_bi_entrance_v01.entrances,
        qshopdemo_qp_bi_view_v01.views, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate, qshopdemo_qp_bi_transaction_v01.revenue_per_visitor,
        qshopdemo_qp_bi_transaction_v01.revenue_per_converter, qshopdemo_qp_bi_view_v01.session_bounce_rate,
        qshopdemo_qp_bi_view_v01.entrance_bounce_rate, pageviews_per_session, pageviews_per_entrance]
      series_labels:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: Revenue
      colors: ['palette: Default']
      series_colors:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: "#c23e22"
        qshopdemo_qp_bi_view_v01.views: "#22eba8"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type
        new_vs_returning: qshopdemo_qp_bi_view_v01.new_vs_returning
        conversion_number: qshopdemo_qp_bi_view_v01.context_conversion_number

    - name: full_detail
      title: "Full Detail"
      width: 120
      height: 70
      top: 125
      left: 0
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_view_v01
      type: table
      fields: [qshopdemo_qp_bi_view_v01.time_data_points_date, qshopdemo_qp_bi_session_v01.sessions,
        qshopdemo_qp_bi_entrance_v01.entrances, qshopdemo_qp_bi_transaction_v01.converters,
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total, qshopdemo_qp_bi_transaction_v01.visitor_conversion_rate,
        qshopdemo_qp_bi_transaction_v01.revenue_per_visitor, qshopdemo_qp_bi_transaction_v01.revenue_per_converter,
        qshopdemo_qp_bi_view_v01.session_bounce_rate, qshopdemo_qp_bi_view_v01.entrance_bounce_rate,
        qshopdemo_qp_bi_view_v01.views]
      fill_fields: [qshopdemo_qp_bi_view_v01.time_data_points_date]
      sorts: [qshopdemo_qp_bi_view_v01.time_data_points_date desc]
      column_limit: 50
      dynamic_fields:
      - table_calculation: pageviews_per_session
        label: Pageviews per session
        expression: "${qshopdemo_qp_bi_view_v01.views} / ${qshopdemo_qp_bi_session_v01.sessions}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
      - table_calculation: pageviews_per_entrance
        label: Pageviews per entrance
        expression: |-
          ${qshopdemo_qp_bi_view_v01.views} /
          ${qshopdemo_qp_bi_entrance_v01.entrances}
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
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
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      series_labels:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: Revenue
      colors: ['palette: Default']
      series_colors:
        qshopdemo_qp_bi_transaction_v01.sum_of_transaction_total: "#c23e22"
        qshopdemo_qp_bi_view_v01.views: "#22eba8"
      listen:
        date_filter: qshopdemo_qp_bi_view_v01.time_data_points_date
        referrer_type: qshopdemo_qp_bi_entrance_v01.referrer_type
        device_type: qshopdemo_qp_bi_session_v01.device_type
        new_vs_returning: qshopdemo_qp_bi_view_v01.new_vs_returning
        conversion_number: qshopdemo_qp_bi_view_v01.context_conversion_number
