-- a SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUsers that computes and store the average
-- weighted score for all students.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
  -- ALX MYSQL version doesn't support WITH
  -- WITH t1 AS (
  --   SELECT SUM(p.weight * c.score) / SUM(p.weight) w, c.user_id FROM projects p
  --   JOIN corrections c
  --   ON c.project_id = p.id
  --   GROUP BY 2
  -- )

  UPDATE users
    SET users.average_score = (
      SELECT t1.w FROM
          (SELECT SUM(p.weight * c.score) / SUM(p.weight) w, c.user_id FROM projects p
          JOIN corrections c
          ON c.project_id = p.id
          GROUP BY 2) t1
      WHERE t1.user_id = users.id
    );
END $$
DELIMITER ;
