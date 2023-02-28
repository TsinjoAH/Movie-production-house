drop owned by movie;

CREATE SEQUENCE "public".feeling_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_character_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_set_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_details_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".feeling ( 
	id                   integer DEFAULT nextval('feeling_id_seq'::regclass) NOT NULL  ,
	name                 varchar  NOT NULL  ,
	CONSTRAINT pk_feeling PRIMARY KEY ( id ),
	CONSTRAINT unq_feeling UNIQUE ( name ) 
 );

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

create table hour_interval (
    id serial primary key ,
    start_hour time not null,
    end_hour time not null check ( end_hour > start_hour )
);

CREATE  TABLE "public".scene (
	id                   integer DEFAULT nextval('scene_id_seq'::regclass) NOT NULL  ,
	movie_id             integer  NOT NULL  ,
	movie_set_id         integer  NOT NULL  ,
	interval_id          integer  NOT NULL  references hour_interval(id),
	scene_number         varchar  NOT NULL  ,
	CONSTRAINT pk_scene PRIMARY KEY ( id ),
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

ALTER TABLE "public".movie_character ADD CONSTRAINT fk_movie_character_movie FOREIGN KEY ( movie_id ) REFERENCES "public".movie( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_feeling FOREIGN KEY ( feeling_id ) REFERENCES "public".feeling( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_movie_character FOREIGN KEY ( character_id ) REFERENCES "public".movie_character( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_scene FOREIGN KEY ( scene_id ) REFERENCES "public".scene( id );
