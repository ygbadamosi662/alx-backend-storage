-- A SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUser that computes and store the
-- average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
  UPDATE users
    SET users.average_score = (
      SELECT SUM(p.weight * c.score) / SUM(p.weight) w FROM projects p
      JOIN corrections c
      ON c.project_id = p.id
      WHERE c.user_id = user_id)
    WHERE users.id = user_id;
END $$
DELIMITER ;
