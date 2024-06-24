final createTable = '''
CREATE TABLE contact (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(200) NOT NULL,
  phone CHAR(16) NOT NULL,
  email VARCHAR(150) NOT NULL,
  avatar VARCAR(300) NOT NULL
)
''';

final insert = '''
INSERT INTO contact (name, phone, email, avatar)
VALUES ('Antonio', '123456789', 'antonio@gmail.com', 'https://cdn.pixabay.com/photo/2013/07/13/12/07/avatar-159236_1280.png')
''';

final insert2 = '''
INSERT INTO contact (name, phone, email, avatar)
VALUES ('Maria', '987654321', 'maria@gmail.com', 'https://cdn.pixabay.com/photo/2013/07/13/12/07/avatar-159236_1280.png')
''';

final insert3 = '''
INSERT INTO contact (name, phone, email, avatar)
VALUES ('José', '456789123', 'jose@gmail.com', 'https://cdn.pixabay.com/photo/2013/07/13/12/07/avatar-159236_1280.png')
''';
