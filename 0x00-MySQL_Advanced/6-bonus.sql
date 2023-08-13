-- A SQL script that creates a stored procedure
-- AddBonus that adds a new correction for a student.
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus (IN user_id INT, IN project_name VARCHAR(100), IN score INT)
BEGIN
-- Declare new variable that will hold evaluated data.
  DECLARE count_project INT DEFAULT 0;
  DECLARE proj_id INT DEFAULT 0;

  SELECT COUNT(*) INTO count_project
    FROM projects
    WHERE name = project_name;
  IF count_project = 0 THEN
    INSERT INTO projects (name) VALUES (project_name);
  END IF;

  SELECT id INTO proj_id
    FROM projects
    WHERE name = project_name;

  INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, proj_id, score);
END $$
DELIMITER ;
