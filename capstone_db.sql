DROP DATABASE IF EXISTS capstone_db;


CREATE DATABASE capstone_db;

\c capstone_db;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  password VARCHAR,
  email VARCHAR,
  first_name VARCHAR,
  last_name  VARCHAR
);

CREATE TABLE playlists (
    playlist_id SERIAL NOT NULL,
    playlist_title VARCHAR(100) NOT NULL,
    description VARCHAR(200) NOT NULL,
    owner_id INTEGER NOT NULL, 
    receiver_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id),
    FOREIGN KEY(owner_id) REFERENCES users(user_id),
    FOREIGN KEY(receiver_id) REFERENCES users(user_id)
);


CREATE TABLE shared_songs (
  shared_song_id Serial PRIMARY KEY,
  song_id TEXT,
  song_name TEXT,
  sender_username VARCHAR,
  receiver_username VARCHAR,
  note VARCHAR,
  url VARCHAR,
  FOREIGN KEY (sender_username) REFERENCES users(username),
  FOREIGN KEY (receiver_username) REFERENCES users(username)
);



