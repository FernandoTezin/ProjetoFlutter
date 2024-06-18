const createTable = '''
CREATE TABLE contact(
  id INT PRIMARY KEY
  ,nome VARCHAR(200) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,email VARCHAR(150)
  ,url_avatar VARCHAR(300) NOT NULL
''';

const insert = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','https://cdn.pixabay.com/photo/2017/01/31/21/22/avatar-2027363_1280.png')
''';

const insert2 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Maitê','(11) 9 9632-8578','maite@email.com','https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png')
''';

const insert3 = '''
INSERT INTO contact (nome, telefone, email, url_avatar)
VALUES ('Hortência','(11) 9 9562-3356','hortencia@email.com','https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_1280.png')
''';
