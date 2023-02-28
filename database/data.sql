INSERT INTO "public".movie
	( id, title, start_date) VALUES ( default, 'Naina vs Boost', '2023-03-01');


INSERT INTO "public".movie_set
	( id, name) VALUES
	( default, 'Avenue Analakely' ),
	( default, 'Marais Masay' ),
	( default, 'Cour ITU' ),
	( default, 'Salon 1' ),
	( default, 'Chambre ado 1' ),
	( default, 'Chambre parents 1' ),
	( default, 'Cuisine 1' ),
	( default, 'Salle a manger 1' ),
	( default, 'Grande Salle ITU' ),
	( default, 'Salle FJKM Malaza' );


INSERT INTO "public".movie_character
	( id, name, movie_id) VALUES
	( default, 'Naina', 1 ),
	( default, 'Boost', 1 ),
	( default, 'Tsinjo', 1 ),
	( default, 'Vinesh', 1 ),
	( default, 'Andy', 1 );


INSERT INTO "public".feeling
	( id, name) VALUES
	( default, 'content' ),
	( default, 'joyeux' ),
	( default, 'triste' ),
	( default, 'embarasse' ),
	( default, 'nerveux' ),
	( default, 'en colere' ),
	( default, 'amoureux' ),
	( default, 'fatigue' ),
	( default, 'mecontent' ),
	( default, 'stresse' ),
	( default, 'festif' );


INSERT INTO hour_interval (start_hour, end_hour) VALUES ('00:00:00', '00:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('01:00:00', '01:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('02:00:00', '02:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('03:00:00', '03:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('04:00:00', '04:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('05:00:00', '05:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('06:00:00', '06:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('07:00:00', '07:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('08:00:00', '08:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('09:00:00', '09:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('10:00:00', '10:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('11:00:00', '11:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('12:00:00', '12:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('13:00:00', '13:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('14:00:00', '14:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('15:00:00', '15:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('16:00:00', '16:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('17:00:00', '17:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('18:00:00', '18:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('19:00:00', '19:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('20:00:00', '20:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('21:00:00', '21:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('22:00:00', '22:59:59');
INSERT INTO hour_interval (start_hour, end_hour) VALUES ('23:00:00', '23:59:59');

INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 1, 13, 'MV1SC1');


INSERT INTO "public".scene_details
	( id, character_id, script, duration, scene_id) VALUES
	( default, 1, 'Naina salue Boost', 10, 1 );

INSERT INTO "public".scene_details
	( id, character_id, script, duration, scene_id) VALUES
	( default, 2, 'Boost salue Naina', 10, 1 );

INSERT INTO "public".scene_details
	( id, script, duration, scene_id) VALUES
	( default, 'Une voiture renverse Naina', 5, 1 );



INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 2, 14, 'MV1SC2' );

INSERT INTO "public".scene_details
	( id, character_id, script, duration, scene_id) VALUES
	( default, 4, 'Vinesh salue Andy', 10, 2 ),
	( default, 5, 'Andy salue Vinesh', 10, 2 );


INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 5, 2, 'Andy pousse Vinesh dans l''eau', 10, 2 );


INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 5, 2, 'Andy est fou de joie', 3, 2 );

INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 4, 8, 'MV1SC3' );


INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 3, 10, 'Tsinjo stresse devant un match de foot', 60, 3 ),
	( default, 3,1, 'Soudain, il apprend que Vinesh est tombe dans le marais Masay, il est content', 60, 3 ),
	( default, 3,3, 'Il apprend ensuite que Naina s'' est fait renverse par une voiture, il est triste', 60, 3 );