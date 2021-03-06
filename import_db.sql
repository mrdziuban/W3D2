CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,

  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL

);

CREATE TABLE questions(
  question_id INTEGER PRIMARY KEY,

  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(user_id)
);

CREATE TABLE question_followers(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(question_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  reply VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(user_id),
  FOREIGN KEY (question_id) REFERENCES questions(question_id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(question_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE tags(
  tag_id INTEGER PRIMARY KEY,
  tag VARCHAR(255) NOT NULL
);

CREATE TABLE question_tags(
  tag_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
  FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

INSERT INTO users('fname','lname')
VALUES ('John','Smith'),('Crazy','Boy');

INSERT INTO questions('title','body','author_id')
VALUES ('Some','Handsome?',1),('dumb one','why am i a boy?',2),
('Hand','What is this?',1),('Test','Is this a test?', 2),
('Test2','Test again?',1),('Test3','Test again again?',2);

INSERT INTO question_followers('question_id','user_id')
VALUES (1,2),(2,1),(1,1);

INSERT INTO replies('reply','author_id','question_id','parent_id')
VALUES ('YES!',2,1,NULL),('because of genetics?',1,2,NULL),('huh?',1,1,1);

INSERT INTO question_likes('question_id','user_id')
VALUES (1,2),(2,1),(1,1),(1,2),(3,1),(4,2),(4,1),(5,1),(5,2),(5,1),(5,2);

INSERT INTO tags('tag')
VALUES ('html'), ('css'), ('ruby'), ('javascript');

INSERT INTO question_tags('tag_id', 'question_id')
VALUES (1,1),(2,2),(3,3),(4,4),(1,5);