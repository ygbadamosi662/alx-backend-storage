-- a SQL script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student.
-- Note: An average score can be a decimal
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
  -- Declare varaible to store the average
  DECLARE average DOUBLE;

  SELECT AVG(score) INTO average FROM corrections c
  WHERE c.user_id = user_id;

  UPDATE users SET average_score = average
  WHERE id = user_id;
END $$
DELIMITER ;
