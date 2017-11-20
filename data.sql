PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    full_name VARCHAR(50),
    email VARCHAR(50)
);


CREATE TABLE post (
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE comment (
    id INTEGER PRIMARY KEY,
    body TEXT,
    post_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(post_id) REFERENCES post(id)
);

INSERT INTO user (id, full_name, email)
VALUES
( 1, 'Fred Thompson', 'ftompson@gmail.com'),
( 2, 'Sue Henderson', 'susie@yahoo.com'),
( 3, 'Thomas Martin', 'tommy_m@hotmail.com');

INSERT INTO post (id, title, body, user_id)
VALUES
( 1, 'My vacation', 'I went to Disney World', 1),
( 2, 'My Halloween', 'I dressed as a mummy', 2),
( 3, 'What I like about SQLite', 'I find it comforting that it just uses files', 3);

INSERT INTO comment (body, post_id, user_id)
VALUES
( 'I preferred Six Flags', 1, 2),
( 'Isn''t the costume flammable?', 2, 1),
( 'Yeah, but it''s not ASCII, is it?', 3, 1);