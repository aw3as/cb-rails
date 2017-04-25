DROP DATABASE pom;
CREATE DATABASE pom;

USE pom;

CREATE TABLE teams (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	conference_id INT(11) NOT NULL,
	school VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE teams ADD INDEX index_teams_on_conference_id (conference_id) USING BTREE;

CREATE TABLE team_records (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	wins_total INT(11) NOT NULL,
	losses_total INT(11) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE team_records ADD INDEX index_team_records_on_team_id (team_id) USING BTREE;

CREATE TABLE total_team_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	fg INT(11) NOT NULL,
	fga INT(11) NOT NULL,
	fgp float,
	tpt INT(11) NOT NULL,
	tpta INT(11) NOT NULL,
	tptp float,
	ft INT(11) NOT NULL,
	fta INT(11) NOT NULL,
	ftp float,
	orb INT(11) NOT NULL,
	drb INT(11) NOT NULL,
	ast INT(11) NOT NULL,
	stl INT(11) NOT NULL,
	pts INT(11) NOT NULL,
	ptsa INT(11) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

DELIMITER $$
CREATE
    TRIGGER update_total_team_percentages BEFORE INSERT
    ON total_team_stats
    FOR EACH ROW BEGIN
        SET NEW.fgp = NEW.fg / NEW.fga;
        SET NEW.tptp = NEW.tpt / NEW.tpta;
        SET NEW.ftp = NEW.ft / NEW.fta;
    END
    $$
DELIMITER ;

ALTER TABLE total_team_stats ADD INDEX index_total_team_stats_on_team_id (team_id) USING BTREE;

CREATE TABLE pg_team_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	fg float NOT NULL,
	fga float NOT NULL,
	fgp float,
	tpt float NOT NULL,
	tpta float NOT NULL,
	tptp float,
	ft float NOT NULL,
	fta float NOT NULL,
	ftp float,
	orb float NOT NULL,
	drb float NOT NULL,
	ast float NOT NULL,
	stl float NOT NULL,
	pts float NOT NULL,
	ptsa float NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

DELIMITER $$
CREATE
    TRIGGER update_pg_team_percentages BEFORE INSERT
    ON pg_team_stats
    FOR EACH ROW BEGIN
        SET NEW.fgp = NEW.fg / NEW.fga;
        SET NEW.tptp = NEW.tpt / NEW.tpta;
        SET NEW.ftp = NEW.ft / NEW.fta;
    END
    $$
DELIMITER ;

ALTER TABLE pg_team_stats ADD INDEX index_pg_team_stats_on_team_id (team_id) USING BTREE;

CREATE TABLE advanced_player_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player_id INT(11) NOT NULL,
	usg float NOT NULL,
	ortg float NOT NULL,
	drtg float NOT NULL,
	ts float NOT NULL,
	efg float NOT NULL,
	ft float NOT NULL,
	tfg float NOT NULL,
	orb float NOT NULL,
	drb float NOT NULL,
	trb float NOT NULL,
	ast float NOT NULL,
	stl float NOT NULL,
	blk float NOT NULL,
	turn float NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE advanced_player_stats ADD INDEX index_advanced_player_stats_on_player_id (player_id) USING BTREE;

CREATE TABLE advanced_team_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	em float NOT NULL,
	o float NOT NULL,
	d float NOT NULL,
	t float NOT NULL,
	luck float NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE advanced_team_stats ADD INDEX index_advanced_team_stats_on_team_id (team_id) USING BTREE;

CREATE TABLE players (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE players ADD INDEX index_players_on_team_id (team_id) USING BTREE;

CREATE TABLE player_descriptions (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player_id INT(11) NOT NULL,
	year VARCHAR(255) NOT NULL,
	position VARCHAR(255) NOT NULL,
	height float NOT NULL,
	weight float NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE player_descriptions ADD INDEX index_player_descriptions_on_player_id (player_id) USING BTREE;

CREATE VIEW full_players AS SELECT players.*, player_descriptions.year, player_descriptions.position, player_descriptions.height, player_descriptions.weight FROM players LEFT JOIN player_descriptions ON players.id = player_descriptions.player_id;

CREATE TABLE total_player_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player_id INT(11) NOT NULL,
	fg INT(11) NOT NULL,
	fga INT(11) NOT NULL,
	fgp float,
	tpt INT(11) NOT NULL,
	tpta INT(11) NOT NULL,
	tptp float,
	ft INT(11) NOT NULL,
	fta INT(11) NOT NULL,
	ftp float,
	orb INT(11) NOT NULL,
	drb INT(11) NOT NULL,
	ast INT(11) NOT NULL,
	stl INT(11) NOT NULL,
	pts INT(11) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

DELIMITER $$
CREATE
    TRIGGER update_total_player_percentages BEFORE INSERT
    ON total_player_stats
    FOR EACH ROW BEGIN
        SET NEW.fgp = NEW.fg / NEW.fga;
        SET NEW.tptp = NEW.tpt / NEW.tpta;
        SET NEW.ftp = NEW.ft / NEW.fta;
    END
    $$
DELIMITER ;

ALTER TABLE total_player_stats ADD INDEX index_total_player_stats_on_player_id (player_id) USING BTREE;

CREATE TABLE pg_player_stats (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	player_id INT(11) NOT NULL,
	fg float NOT NULL,
	fga float NOT NULL,
	fgp float,
	tpt float NOT NULL,
	tpta float NOT NULL,
	tptp float,
	ft float NOT NULL,
	fta float NOT NULL,
	ftp float,
	ast float NOT NULL,
	stl float NOT NULL,
	pts float NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

DELIMITER $$
CREATE
    TRIGGER update_pg_player_percentages BEFORE INSERT
    ON pg_player_stats
    FOR EACH ROW BEGIN
        SET NEW.fgp = NEW.fg / NEW.fga;
        SET NEW.tptp = NEW.tpt / NEW.tpta;
        SET NEW.ftp = NEW.ft / NEW.fta;
    END
    $$
DELIMITER ;

ALTER TABLE pg_player_stats ADD INDEX index_pg_player_stats_on_player_id (player_id) USING BTREE;

create table conferences (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

create table coaches (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	team_id INT(11) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL,
	updated_at DATETIME NOT NULL
);

ALTER TABLE coaches ADD INDEX index_coaches_on_team_id (team_id) USING BTREE;