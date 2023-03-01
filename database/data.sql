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

INSERT INTO "public".feeling
	( id, name) VALUES ( default, 'confiant' );

INSERT INTO "public".feeling
	( id, name) VALUES ( default, 'peur' );


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


INSERT INTO "public".movie_character
	( id, name, movie_id) VALUES
	( default, 'Ny Antsa', 1 ),
	( default, 'Hasina', 1 ),
	( default, 'Mendrika', 1 );


INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 9, 12, 'MV1SC4' );

INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 6, 8, 'Ny Antsa se repose en attendant Hasina', 120, 4 ),
	( default, 7, 5, 'Hasina arrive enfin et se depeche de creer le projet Chocolat sur Git', 180, 4 ),
	( default, null ,null, 'Tout le monde se donne a fond pour gagner des friandises', 120, 4 );


INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 4, 16, 'MV1SC5' );


INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 6, 12, 'Ny Antsa propose a Andy une partie de FIFA', 60, 5 ),
	( default, 5, 12, 'Andy accepte avec plaisir', 30, 5 ),
	( default, 6, 6, 'Ny Antsa se fait laminer et accuse Andy de tricher', 60, 5 ),
	( default, 5, 2, 'Andy est fou de joie', 60, 5 );


INSERT INTO "public".movie_character
	( id, name, movie_id) VALUES
	( default, 'Lili', 1 ),
	( default, 'Liantsoa', 1 );

INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES
	( default, 1, 3, 16, 'MV1SC6' );

INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 9, 1, 'Lili propose a Liantsoa et Mendrika de jouer a cache-cache', 30, 6 ),
	( default, 8, 2, 'Mendrika accepte avec joie', 30, 6 ),
	( default, 10, 13, 'Liantsoa a peur de se retrouver seule mais accepte quand meme', 30, 6 );


	INSERT INTO "public".break_day
	( id, day_of_week) VALUES
	( default, 6 ),
	( default, 7 );

	INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES ( default, 1, 3, 16, 'MV1SC7' );

	INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 4, null, 'Vinesh arrive dans la cour en scooter et se gare', 600, 7 ),
	( default, 4, null, 'Vinesh attend que les autres le rejoignent et il tourne en rond', 300, 7 ),
	( default, 5, 1, 'Andy, tout content, arrive enfin, il a gagne sur FIFA', 180, 7 ),
	( default, 2, 3, 'Boost arrive aussi, triste d''avoir perdu', 180, 7 ),
	( default, 4, 5, 'Tout le monde Hasina, Vinesh est nerveux car il est trop long', 600, 7 ),
	( default, 7, null, 'Hasina arrive enfin et marche tres lentement', 300, 7 ),
	( default, 5, 6, 'Andy est en colere contre Hasina et veut se battre', 300, 7 ),
	( default, 2, null, 'Boost tente de calmer Andy', 300, 7 ),
	( default, null, null, 'Finalement, tout s''arrange et le groupe part ensemble chez Extra Pizza', 180, 7 );

	INSERT INTO "public".movie_set
	( id, name) VALUES ( default, 'Salle Extra Pizza Iavoloha' );

	UPDATE "public".movie SET start_date = '2023-03-03' ;

	INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES ( default, 1, 11, 16, 'MV1SC8' );

	INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, null, null, 'Le groupe d''amis arrive chez Extra Pizza Iavoloha a pied, ils marchent lentement', 300, 8 ),
	( default, null, null, 'Ils attendent Vinesh qui arrivera en moto', 300, 8 ),
	( default, 5, 5, 'Andy se plaint qu''il a faim et decide de commander un jus sans attendre Vinesh ', 300, 8 ),
	( default, 4, null, 'Vinesh arrive enfin et gare sa moto ', 300, 8 ),
	( default, null, null, 'Tout le monde peut enfin passer sa commande ', 600, 8 ),
	( default, null, null, 'En attendant d''etre servi, Andy et Ny Antsa s''affrontent a fifa ', 600, 8 ),
	( default, 5, 2, 'Andy gagne encore et est fou de joie ', 180, 8 ),
	( default, null, null, 'Les commandes arrivent enfin et tout le monde deguste sans dire un mot ', 300, 8 );

	UPDATE "public".movie SET title = 'Welcome to ITU' ;

	INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES ( default, 1, 9, 16, 'MV1SC9' );

	INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 2, 10, 'Boost arrive en cours, stresse a l''idee d''affronter l''examen', 300, 9 ),
	( default, 1, 12, 'Andy arrive aussi en cours, confiant a l''idee d''affronter l''examen', 300, 9 ),
	( default, 4, 12, 'Vinesh arrive egalement, confiant a l''idee d''affronter l''examen', 300, 9 ),
	( default, 1, 10, 'Naina arrive egalement, mais un peu stresse', 300, 9 ),
	( default, 3, 12, 'Tsinjo arrive egalement, tres confiant', 300, 9 ),
	( default, 6, 12, 'Ny Antsa arrive egalement, tres confiant', 300, 9 ),
	( default, null, null, 'Le groupe revise ensemble afin d''etre pret', 600, 9 ),
	( default, null, null, 'L''examen commence enfin et tout le monde se focalise sur sa copie', 600, 9 ),
	( default, null, null, 'L''examen se termine et tout le monde est soulage', 300, 9 );

	UPDATE "public".movie_character SET name = 'Ny Aina' where id = 1 ;

	UPDATE "public".scene_details SET script = 'Ny Aina salue Boost' where id = 1 ;
	UPDATE "public".scene_details SET script = 'Une voiture passe et Ny Aina monte dedans' where id = 3 ;
	UPDATE "public".scene_details SET script = 'Il apprend ensuite que Ny Aina a perdu a fifa, il est triste' where id = 10 ;
	UPDATE "public".scene_details SET script = 'Ny Aina arrive egalement, mais un peu stresse' where id = 41 ;

	INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES ( default, 1, 1, 12, 'MV1SC10' );

	INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 3, null, 'Tsinjo arrive a Analakely, il descend du bus et attend les autres devant l''hotel de ville', 300, 10 ),
	( default, 4, null, 'Vinesh arrive egalement, il arrive a moto et se gare sur l''avenue', 300, 10 ),
	( default, 5, null, 'Andy et Boost arrivent dans la voiture de Boost, Andy sort en premier tres joyeux a l''idee d''acheter une rtx', 300, 10 ),
	( default, null, null, 'Le groupe marche dans toute l''avenue a la recherche d''une RTX', 600, 10 ),
	( default, null, null, 'Ils testent d''abord un magasin mais ils ne vendent que des RTX bas de gamme', 600, 10 ),
	( default, null, null, 'Ils trouvent enfin la RTX tant convoitee, et ils repartent avec un exemplaire chacun', 600, 10 ),
	( default, null, null, 'Finalement, ils degustent une glace avant de rentrer', 600, 10 );


	INSERT INTO "public".scene
	( id, movie_id, movie_set_id, interval_id, scene_number) VALUES ( default, 1, 7, 12, 'MV1SC11' );

	INSERT INTO "public".scene_details
	( id, character_id, feeling_id, script, duration, scene_id) VALUES
	( default, 9, null, 'Lili appelle ses amies pour les proposer de venir cuisiner, elles acceptent avec joie', 300, 11 ),
	( default, 8, null, 'Mendrika arrive en premier, elle apporte des bananes et les deposent immediatement au refrigerateur', 300, 11 ),
	( default, 9, 1, 'Lili est contente car elle adore les bananes, elle prend Mendrika dans ses bras', 300, 11 ),
	( default, 10, null, 'Liantsoa arrive ensuite, elle apporte du chocolat et les rangent immediatement au placard', 300, 11 ),
    ( default, 9,2, 'Lili est encore plus joyeuse car elle adore le chocolat, elle prend ses amies dans ses bras', 300, 11 ),
	( default, null, null, 'Les trois amies decident alors de faire un gateau a la banane et au chocolat, elles s''y mettent', 600, 11 ),
	( default, 1, 1, 'Alors que le gateau sort juste du four, Ny Aina arrive et coupe immediatement un morceau pour le manger', 300, 11 ),
	( default, 10, 9, 'Liantsoa n''est pas contente et dit a Ny Aina d''arreter, mais Ny Aina continue et termine le gateau', 600, 11 ),
	( default, null,null, 'Finalement, les autres prennent aussi une part et Ny Aina en a rajoute', 400, 11 );