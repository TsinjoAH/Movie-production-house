drop owned by movie;

CREATE SEQUENCE "public".break_day_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".feeling_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".hour_interval_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_character_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".movie_set_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".planning_details_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".planning_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_details_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".scene_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".break_day ( 
	id                   integer DEFAULT nextval('break_day_id_seq'::regclass) NOT NULL  ,
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

CREATE  TABLE "public".planning ( 
	id                   integer DEFAULT nextval('planning_id_seq'::regclass) NOT NULL  ,
	movie_id             integer    ,
	date_start           date    ,
	date_end             date    ,
	CONSTRAINT pk_planning PRIMARY KEY ( id )
 );

CREATE  TABLE "public".scene_status ( 
	id                   integer  NOT NULL  ,
	name                 varchar  NOT NULL  ,
	CONSTRAINT scene_status_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE "public".scene ( 
	id                   integer DEFAULT nextval('scene_id_seq'::regclass) NOT NULL  ,
	movie_id             integer  NOT NULL  ,
	movie_set_id         integer  NOT NULL  ,
	interval_id          integer  NOT NULL  ,
	scene_number         varchar  NOT NULL  ,
	scene_status_id      integer DEFAULT 10 NOT NULL  ,
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

CREATE  TABLE "public".planning_details ( 
	id                   integer DEFAULT nextval('planning_details_id_seq'::regclass) NOT NULL  ,
	planning_id          integer    ,
	scene_id             integer    ,
	timestamp_start      timestamp    ,
	timestamp_end        timestamp    ,
	CONSTRAINT pk_planning_details PRIMARY KEY ( id )
 );

ALTER TABLE "public".movie_character ADD CONSTRAINT fk_movie_character_movie FOREIGN KEY ( movie_id ) REFERENCES "public".movie( id );

ALTER TABLE "public".planning ADD CONSTRAINT fk_planning_movie FOREIGN KEY ( movie_id ) REFERENCES "public".movie( id );

ALTER TABLE "public".planning_details ADD CONSTRAINT fk_planning_details_planning FOREIGN KEY ( planning_id ) REFERENCES "public".planning( id );

ALTER TABLE "public".planning_details ADD CONSTRAINT fk_planning_details_scene FOREIGN KEY ( scene_id ) REFERENCES "public".scene( id );

ALTER TABLE "public".scene ADD CONSTRAINT scene_interval_id_fkey FOREIGN KEY ( interval_id ) REFERENCES "public".hour_interval( id );

ALTER TABLE "public".scene ADD CONSTRAINT scene_status_id_fkey FOREIGN KEY ( scene_status_id ) REFERENCES "public".scene_status( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_feeling FOREIGN KEY ( feeling_id ) REFERENCES "public".feeling( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_movie_character FOREIGN KEY ( character_id ) REFERENCES "public".movie_character( id );

ALTER TABLE "public".scene_details ADD CONSTRAINT fk_scene_details_scene FOREIGN KEY ( scene_id ) REFERENCES "public".scene( id );


CREATE VIEW "public".v_scene_duration AS  SELECT scene_details.scene_id,
    sum(scene_details.duration) AS duration
   FROM scene_details
  GROUP BY scene_details.scene_id;


CREATE VIEW "public".v_scene AS  SELECT s.id,
    s.movie_id,
    s.movie_set_id,
    s.interval_id,
    s.scene_number,
    s.scene_status_id,
    vsd.duration
   FROM (scene s
     JOIN v_scene_duration vsd ON ((s.id = vsd.scene_id)));



