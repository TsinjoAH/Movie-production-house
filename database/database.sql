drop owned by movie;

CREATE SEQUENCE "public".feeling_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".hour_interval_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_character_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_set_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_details_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".break_day ( 
	id                   serial  NOT NULL  ,
	day_of_week          integer  NOT NULL  ,
	CONSTRAINT pk_break_day PRIMARY KEY ( id )
 );

CREATE  TABLE "public".feeling ( 
	id                   integer DEFAULT nextval('feeling_id_seq'::regclass) NOT NULL  ,
	name                 varchar  NOT NULL  ,
	CONSTRAINT pk_feeling PRIMARY KEY ( id ),
	CONSTRAINT unq_feeling UNIQUE ( name ) 
 );

CREATE  TABLE "public".hour_interval ( 
	id                   integer DEFAULT nextval('hour_interval_id_seq'::regclass) NOT NULL  ,
	start_hour           time  NOT NULL  ,
	end_hour             time  NOT NULL  ,
	CONSTRAINT hour_interval_pkey PRIMARY KEY ( id )
 );

ALTER TABLE "public".hour_interval ADD CONSTRAINT hour_interval_check CHECK ( (end_hour > start_hour) );

CREATE  TABLE "public".movie ( 
	id                   integer DEFAULT nextval('movie_id_seq'::regclass) NOT NULL  ,
	title                varchar  NOT NULL  ,
	start_date           date  NOT NULL  ,
	CONSTRAINT pk_movie PRIMARY KEY ( id )
 );

CREATE  TABLE "public".movie_character ( 
	id                   integer DEFAULT nextval('movie_character_id_seq'::regclass) NOT NULL  ,
	name                 varchar  NOT NULL  ,
	movie_id             integer  NOT NULL  ,
	CONSTRAINT pk_tbl PRIMARY KEY ( id )
 );

CREATE  TABLE "public".movie_set ( 
	id                   integer DEFAULT nextval('movie_set_id_seq'::regclass) NOT NULL  ,
	name                 varchar  NOT NULL  ,
	CONSTRAINT pk_movie_set PRIMARY KEY ( id )
 );

CREATE  TABLE "public".scene ( 
	id                   integer DEFAULT nextval('scene_id_seq'::regclass) NOT NULL  ,
	movie_id             integer  NOT NULL  ,
	movie_set_id         integer  NOT NULL  ,
	interval_id          integer  NOT NULL  ,
	scene_number         varchar  NOT NULL  ,
	scene_status_id     integer NOT NULL DEFAULT 10,
	CONSTRAINT pk_scene PRIMARY KEY ( id ) ,
	CONSTRAINT unq_scene UNIQUE ( scene_number ) 
 );

CREATE  TABLE "public".scene_details ( 
	id                   integer DEFAULT nextval('scene_details_id_seq'::regclass) NOT NULL  ,
	character_id         integer    ,
	feeling_id           integer    ,
	script               text  NOT NULL  ,
	duration             double precision  NOT NULL  ,
	scene_id             integer  NOT NULL  ,
	CONSTRAINT pk_scene_details PRIMARY KEY ( id )
 );

CREATE TABLE "public".scene_status
(
    id   integer PRIMARY KEY,
    name VARCHAR NOT NULL
);

ALTER TABLE "public".movie_character ADD CONSTRAINT fk_movie_character_movie FOREIGN KEY ( movie_id ) REFERENCES "public".movie( id );

ALTER TABLE "public".scene ADD CONSTRAINT scene_interval_id_fkey FOREIGN KEY ( interval_id ) REFERENCES "public".hour_interval( id );
ALTER TABLE "public".scene ADD CONSTRAINT scene_status_id_fkey FOREIGN KEY ( scene_status_id ) REFERENCES "public".scene_status( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_feeling FOREIGN KEY ( feeling_id ) REFERENCES "public".feeling( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_movie_character FOREIGN KEY ( character_id ) REFERENCES "public".movie_character( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_scene FOREIGN KEY ( scene_id ) REFERENCES "public".scene( id );

create view v_scene_duration as
select scene_id, sum(duration) duration from scene_details group by scene_id;

create view v_scene as
select s.*, duration
from scene s join v_scene_duration vsd on s.id = vsd.scene_id;

CREATE  TABLE "public".planning ( 
	id                   serial  NOT NULL  ,
	movie_id             integer    ,
	date_start           date    ,
	date_end             date    ,
	CONSTRAINT pk_planning PRIMARY KEY ( id )
 );

CREATE  TABLE "public".planning_details ( 
	id                   serial  NOT NULL  ,
	planning_id          integer    NOT NULL,
	scene_id             integer    NOT NULL,
	timestamp_start      timestamp    NOT NULL,
	timestamp_end        timestamp    NOT NULL,
	CONSTRAINT pk_planning_details PRIMARY KEY ( id ),
	CONSTRAINT fk_planning_details_planning FOREIGN KEY ( planning_id ) REFERENCES "public".planning( id )   
 );


CREATE TABLE "public".available_movie_sets (
    id serial       NOT NULL PRIMARY KEY ,
    movie_set_id    INTEGER NOT NULL,
    timestamp_start      timestamp    NOT NULL,
    timestamp_end     timestamp    NOT NULL,
    CONSTRAINT fk_available_movie_sets FOREIGN KEY (movie_set_id) REFERENCES "public".movie_set( id )
);

