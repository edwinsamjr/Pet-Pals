BEGIN TRANSACTION;

DROP TABLE IF EXISTS pet_playdate;
DROP TABLE IF EXISTS playdates;

DROP SEQUENCE IF EXISTS seq_playdate_id;

CREATE SEQUENCE seq_playdate_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE playdates (
	playdate_id int DEFAULT nextval('seq_playdate_id'::regclass) NOT NULL,
	playdate_title varchar(50) UNIQUE NOT NULL,
	playdate_location varchar(200) NOT NULL,
	playdate_date date NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL,
	host_id int NOT NULL CONSTRAINT fk_host_id REFERENCES users(user_id),
	active boolean NOT NULL,
	CONSTRAINT PK_playdate_id PRIMARY KEY (playdate_id)
);

INSERT INTO playdates (playdate_title, playdate_location, playdate_date, start_time, end_time, host_id, active) VALUES ('Meow Party', 'Eden Park', '2022-04-24', '2:00 PM', '4:00 PM', 7, true);
INSERT INTO playdates (playdate_title, playdate_location, playdate_date, start_time, end_time, host_id, active) VALUES ('Sprint into Summit', 'Summit Park', '2022-04-22', '1:00 PM', '3:00 PM', 6, true);
INSERT INTO playdates (playdate_title, playdate_location, playdate_date, start_time, end_time, host_id, active) VALUES ('Flex on the Grid', 'Fido Field', '2022-05-13', '1:00 PM', '3:00 PM', 5, true);
INSERT INTO playdates (playdate_title, playdate_location, playdate_date, start_time, end_time, host_id, active) VALUES ('Charlie''s Get Together', 'Winton Woods', '2022-05-07', '9:00 PM', '11:00 PM', 4, true);



COMMIT TRANSACTION;
