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


INSERT INTO "public".scene
	( id, movie_id, movie_set_id, start_hour, end_hour, scene_number) VALUES
	( default, 1, 1, '14:00', '16:00', 'MV1SC1');


INSERT INTO "public".scene_details
	( id, character_id, script, duration, scene_id) VALUES
	( default, 1, 'Naina salue Boost', 10, 1 );

INSERT INTO "public".scene_details
	( id, character_id, script, duration, scene_id) VALUES
	( default, 2, 'Boost salue Naina', 10, 1 );

INSERT INTO "public".scene_details
	( id, script, duration, scene_id) VALUES
	( default, 'Une voiture renverse Naina', 5, 1 );