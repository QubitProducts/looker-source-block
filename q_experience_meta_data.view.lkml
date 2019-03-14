view: q_experience_meta_data {
  derived_table: {
    sql:
     WITH
      iterations AS
      (
        SELECT
          experienceId AS experienceId,
          variationMasterId AS variationMasterId,
          iterationId AS iterationId,
          MAX(iterationName) AS iterationName,
          MIN(iterationStartedAt) AS iterationStartedAt,
          MIN(iterationPublishedAt) AS iterationPublishedAt,
          MIN(iterationPausedAt) AS iterationPausedAt
        FROM
          `qubit-client-{{q_view_v01.project._parameter_value}}.{{q_view_v01.site._parameter_value}}__v2.aux_experience_iteration_variation_v01`
        WHERE
          experienceId IS NOT NULL
          AND iterationId IS NOT NULL
          AND variationMasterId IS NOT NULL
        GROUP BY
          1,
          2,
          3 ),

      iteration_metadata AS
      (
        SELECT
          experienceId,
          variationMasterId,
          iterationId,
          iterationName,
          iterationStartedAt,
          iterationPausedAt,
          IF (iterationPublishedAt IS NULL,
            TRUE,
            FALSE) AS inDraft,
          IF (iterationId = FIRST_VALUE(iterationId) OVER (PARTITION BY experienceId, variationMasterId ORDER BY iterationStartedAt DESC),
            TRUE,
            FALSE) AS isLatestIteration
        FROM
          iterations
      ),

      status AS
      (
        SELECT
          *,
          IF (isLatestIteration = TRUE
            AND iterationPausedAt IS NULL
            AND iterationStartedAt IS NOT NULL,
            TRUE,
            FALSE) AS isActive
        FROM
          iteration_metadata
      ),

      latestName AS (
        SELECT
          ROW.experienceId,
          ROW.experienceName
        FROM (
          SELECT
            ARRAY_AGG(t
            ORDER BY
              meta_recordDate DESC
            LIMIT
              1)[
          OFFSET
            (0)] AS ROW
          FROM
            `qubit-client-{{q_view_v01.project._parameter_value}}.{{q_view_v01.site._parameter_value}}__v2.aux_experience_iteration_variation_v01` AS t
          GROUP BY
            experienceId,
            experienceName
        )
    )

    SELECT
      CAST(status.experienceId AS STRING) experienceId,
      CAST(experienceName as STRING) experienceName,
      DATE(MIN(iterationStartedAt)) experience_first_published_at,
      DATE(MAX(iterationPausedAt)) experience_last_paused_at,
      MAX(isActive) AS is_active

    FROM
      status

    LEFT JOIN
      latestName on (status.experienceId = latestName.experienceId)

    GROUP BY
      1, 2
    ;;
    }

    dimension: experience_id {
      type: string
      sql: CAST(${TABLE}.experienceId AS STRING) ;;
      hidden: yes
    }

    dimension: experience_name {
      type: string
      sql: ${TABLE}.experienceName ;;
      view_label: "Experiences"
      group_label: "Experience"
      label: "Experience Name"
      description: "The name of experience in app.qubit.com."
    }

    dimension: current_experience_status {
      view_label: "Experiences"
      type: string
      sql: IF(${TABLE}.is_active = true , "Active" , "Paused") ;;
      label: "Current Experience Status "
      description: "Status of the experience as of today."
      group_label: "Experience"
    }

    dimension: experience_first_published_at {
      view_label: "Experiences"
      type: date
      sql: TIMESTAMP(${TABLE}.experience_first_published_at) ;;
      group_label: "Experience"
      description: "Date the experience was first published."
    }

    dimension: experience_last_paused_at {
      view_label: "Experiences"
      type: date
      sql: TIMESTAMP(${TABLE}.experience_last_paused_at) ;;
      group_label: "Experience"
      description: "The recent date experience was paused."
    }
}