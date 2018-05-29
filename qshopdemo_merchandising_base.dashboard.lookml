#File uploaded: Mon Apr 09 14:05:48 GMT 2018
- dashboard: qshopdemo_merchandising_base
  title: "qshopdemo - Merchandising Report"
  extension: required
  layout: static
  tile_size: 10
  width: 1200

  filters:

    - name: date_filter
      title: "Product interaction date"
      type: date_filter
      default_value: 30 days ago for 30 days

    - name: product_category
      title: "Product category"
      type: field_filter
      explore: qshopdemo_qp_bi_product_v01
      field: qshopdemo_qp_bi_product_v01.product_category

    - name: product_name
      title: "Product name"
      type: field_filter
      explore: qshopdemo_qp_bi_product_v01
      field: qshopdemo_qp_bi_product_v01.product_name

    - name: product_interaction_type
      title: "Interaction type"
      type: field_filter
      explore: qshopdemo_qp_bi_product_v01
      field: qshopdemo_qp_bi_product_v01.product_interaction_type

  elements:

    - name: description
      width: 120
      height: 18
      top: 0
      left: 0
      type: text
      explore: qshopdemo_qp_bi_product_v01
      title_text: "Merchandising Report"
      subtitle_text: ""
      body_text: "This report shows the performance of all products. Analysis is focused on visitor count on various stages of product interaction. Possible product interaction stages are: Product Listing View, Product Detail View, Product View, View with Product in Basket, Basket Action, Product Purchase (some of them may be missing if the property is not emitting a particular QP event). Hover over any chart, click the three dots icon in top right corner and use Explore From Here to create your custom exploration using all Live Tap data."

    - name: funnel
      width: 120
      height: 50
      top: 18
      left: 0
      title: "Product interaction funnel performance"
      note:
        text: "This chart shows funnel performance of all products, starting from the Product Listing View, ending with purchase. Percentage labels show share in stage 1 (Product Listing View). Use filters to see performance of a single product category or product."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_product_v01
      type: looker_funnel
      fields: [qshopdemo_qp_bi_product_v01.product_interaction_type,
        qshopdemo_qp_bi_product_v01.product_visitors]
      filters:
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered: 1. Product Listing View,2. Product Detail View,3. View with Product in Basket,4. Basket Action,5. Product Purchase,-NULL
      sorts: [qshopdemo_qp_bi_product_v01.product_visitors desc]
      query_timezone: Europe/London
      leftAxisLabelVisible: true
      leftAxisLabel: Product interaction funnel stage
      rightAxisLabelVisible: true
      rightAxisLabel: Number of unique visitors
      barColors: ['palette: Default']
      smoothedBars: true
      orientation: automatic
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: right
      labelColorEnabled: false
      labelColor: "#ffffff"
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
      listen:
        date_filter: qshopdemo_qp_bi_product_v01.time_data_points_date
        product_category: qshopdemo_qp_bi_product_v01.product_category
        product_name: qshopdemo_qp_bi_product_v01.product_name
        product_interaction_type: qshopdemo_qp_bi_product_v01.product_interaction_type

    - name: area_chart
      width: 120
      height: 40
      top: 68
      left: 0
      title: "Product interactors over time"
      note:
        text: "One series per interaction type."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_product_v01
      type: looker_area
      fields: [qshopdemo_qp_bi_product_v01.time_data_points_date,
        qshopdemo_qp_bi_product_v01.product_visitors, qshopdemo_qp_bi_product_v01.product_interaction_type]
      pivots: [qshopdemo_qp_bi_product_v01.product_interaction_type]
      fill_fields: [qshopdemo_qp_bi_product_v01.time_data_points_date]
      filters:
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered: 1. Product Listing View,2. Product Detail View,3. View with Product in Basket,4. Basket Action,5. Product Purchase,-NULL
      sorts: [qshopdemo_qp_bi_product_v01.time_data_points_date
          desc, qshopdemo_qp_bi_product_v01.product_interaction_type]
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
      show_null_points: true
      point_style: none
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      ordering: none
      show_null_labels: false
      series_types: {}
      y_axes: [{label: Unique visitors, maxValue: !!null '', minValue: !!null '', orientation: left,
          showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
          type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: Product
                Detail View, name: Product Detail View}, {id: Product Listing View, name: Product
                Listing View}, {id: Product Purchase, name: Product Purchase}, {id: View
                with Product in Basket, name: View with Product in Basket}]}]
      focus_on_hover: false
      hidden_series: []
      series_colors:
        View with Product in Basket - qshopdemo_qp_bi_product_v01.product_visitors: "#e35d51"
      x_axis_label: Product interaction date
      x_axis_datetime_label: "%d %b %Y"
      listen:
        date_filter: qshopdemo_qp_bi_product_v01.time_data_points_date
        product_category: qshopdemo_qp_bi_product_v01.product_category
        product_name: qshopdemo_qp_bi_product_v01.product_name
        product_interaction_type: qshopdemo_qp_bi_product_v01.product_interaction_type

    - name: product_categories
      width: 60
      height: 40
      top: 108
      left: 0
      title: "Product interactors by product category"
      note:
        text: "All interaction types are aggregated in this chart. Use FILTERS to narrow data to a single interaction type."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_product_v01
      type: looker_column
      fields: [qshopdemo_qp_bi_product_v01.product_category,
        qshopdemo_qp_bi_product_v01.product_visitors]
      filters:
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered: 1. Product Listing View,2. Product Detail View,3. View with Product in Basket,4. Basket Action,5. Product Purchase,-NULL
      sorts: [qshopdemo_qp_bi_product_v01.product_visitors
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
      x_axis_label: Product category
      listen:
        date_filter: qshopdemo_qp_bi_product_v01.time_data_points_date
        product_category: qshopdemo_qp_bi_product_v01.product_category
        product_name: qshopdemo_qp_bi_product_v01.product_name
        product_interaction_type: qshopdemo_qp_bi_product_v01.product_interaction_type

    - name: map
      width: 60
      height: 40
      top: 108
      left: 60
      title: "Product interactors geographic distribution"
      note:
        text: "All interaction types are aggregated in this chart. Use FILTERS to narrow data to a single interaction type."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_product_v01
      type: looker_geo_choropleth
      fields: [qshopdemo_qp_bi_session_v01.ip_location_country_code,
        qshopdemo_qp_bi_product_v01.product_visitors]
      filters:
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered: 1. Product Listing View,2. Product Detail View,3. View with Product in Basket,4. Basket Action,5. Product Purchase,-NULL
      sorts: [qshopdemo_qp_bi_product_v01.product_visitors desc]
      query_timezone: Europe/London
      map: world
      map_projection: kavrayskiy7
      show_view_names: false
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
      show_antarctica: false
      colors: ["#E9F6F1", "#47b28d"]
      empty_color: "#e2e2e2"
      listen:
        date_filter: qshopdemo_qp_bi_product_v01.time_data_points_date
        product_category: qshopdemo_qp_bi_product_v01.product_category
        product_name: qshopdemo_qp_bi_product_v01.product_name
        product_interaction_type: qshopdemo_qp_bi_product_v01.product_interaction_type

    - name: product_detail
      width: 120
      height: 50
      top: 148
      left: 0
      title: "Product interactors - full detail table, by product name"
      note:
        text: "Each row represents a single product. A heatmap applied on numeric cells shows the most significant products and interaction types."
        state: expanded
        display: hover
      model: qshopdemo_livetap
      explore: qshopdemo_qp_bi_product_v01
      type: table
      fields: [qshopdemo_qp_bi_product_v01.product_name,
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered,
        qshopdemo_qp_bi_product_v01.product_visitors, qshopdemo_qp_bi_product_v01.product_category]
      pivots: [qshopdemo_qp_bi_product_v01.product_interaction_type_ordered]
      filters:
        qshopdemo_qp_bi_product_v01.product_interaction_type_ordered: 1. Product Listing View,2. Product Detail View,3. View with Product in Basket,4. Basket Action,5. Product Purchase,-NULL
      sorts: [qshopdemo_qp_bi_product_v01.product_visitors desc
          3, qshopdemo_qp_bi_product_v01.product_interaction_type_ordered
          0]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
          font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF", "#4FBC89"]},
          bold: false, italic: false, strikethrough: false}]
      listen:
        date_filter: qshopdemo_qp_bi_product_v01.time_data_points_date
        product_category: qshopdemo_qp_bi_product_v01.product_category
        product_name: qshopdemo_qp_bi_product_v01.product_name
        product_interaction_type: qshopdemo_qp_bi_product_v01.product_interaction_type
