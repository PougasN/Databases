CREATE USER 'host'@'%' IDENTIFIED BY 'hostpassword';
GRANT ALL PRIVILEGES ON olympicsdb.* TO 'host'@'%';
REVOKE DELETE ON olympicsdb.* FROM 'host'@'%';

CREATE USER 'team_manager'@'%' IDENTIFIED BY 'teampassword';
GRANT INSERT, UPDATE ON olympicsdb.athlete TO'team_manager'@'%';
GRANT SELECT ON olympicsdb.* TO'team_manager'@'%';

CREATE USER 'athlete'@'%' IDENTIFIED BY 'athletepassword';
GRANT SELECT ON olympicsdb.* TO 'athlete'@'%';

CREATE USER 'spectator'@'%' IDENTIFIED BY 'specpassword';
GRANT SELECT ON olympicsdb.* TO 'spectator'@'%';

CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON olympicsdb.* TO 'administrator'@'localhost';

