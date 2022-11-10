
DROP DATABASE IF EXISTS monsterdevs;
CREATE DATABASE monsterdevs CHARACTER SET utf8 COLLATE utf8_general_ci;
USE monsterdevs;

CREATE TABLE users (

    uid INT PRIMARY KEY AUTO_INCREMENT,
    udate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    birth DATE,
    bio TEXT,
    type ENUM('admin', 'author', 'moderator', 'user') DEFAULT 'user',
    last_login DATETIME,
    ustatus ENUM('online', 'deleted', 'banned') DEFAULT 'online'
);

INSERT INTO users (
    uid,
    name,
    email,
    password,
    photo,
    birth,
    bio,
    type
) VALUES (

    '1',
    'Jurandi da Silva',
    'Jurandi@silva.com',
    SHA1('senha123'),
     'https://randomuser.me/api/portraits/men/15.jpg',
    '1990-12-14',
    'Pintor, programador, escultor e enrolador.',
    'author'
), 
(
    '2',
    'Marineta Aurora',
    'mari@neta.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/women/27.jpg',
    '2002-03-21',
    'Escritora, montadora, organizadora e professora.',
    'author'
), (
    '3',
    'Alexa Amazon',
    'alexa@amazon.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/women/22.jpg',
    '2004-08-19',
    'Sensitiva, intuitiva, normativa e omissiva.',
    'author'
), (
    '4',
    'Alex Ross',
    'alex@ross.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/men/28.jpg',
    '1979-02-03',
    'Um dos maiores inimigos do Pernalonga.',
    'author'
);

CREATE TABLE articles (
    aid INT PRIMARY KEY AUTO_INCREMENT,
    adate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    resume VARCHAR(255) NOT NULL,
    astatus ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    views INT DEFAULT 0,
    FOREIGN KEY (author) REFERENCES users (uid)
);

INSERT INTO articles (
    adate,
    author,
    title,
    content,
    thumbnail,
    resume
) VALUES (
    '2022-09-14 10:44:45',
    '1',
    'Por que preciso contratar um DevOps',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/200',
    'Apesar do que ouvimos por aí, o seu sobrinho não sabe de tudo.'
), (
    '2022-09-26 14:55:45',
    '2',
    'Meu sobrinho não sabe nadar',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/199',
    'O sobrinho dele precisa aprender a nadar. Sabe por que?'
), (
    '2022-09-30 22:10:45',
    '2',
    'Achei um site igual o meu',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/198',
    'Invista em profissionais competentes e saia da mesmice.'
), (
    '2022-10-02 12:55:45',
    '4',
    'O programador programa ?',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/201',
    'O incrível mundo do programador que só copia e cola.'
), (
    '2022-10-04 14:55:45',
    '3',
    'Impacto Monster',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/202',
    'Virar um monstro na sua area pode ser algo bom.'
), (
    '2022-10-10 23:59:59',
    '3',
    'A vida atrás da tela',
    '<p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/">GitHub do Autor</a></li><li><a href="https://catabits.com.br">Blog do Autor</a></li><li><a href="https://facebook.com/">Facebook do Autor</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/203',
    'Apesar do que parece o computador não faz nada sozinho.'
);

CREATE TABLE comments (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cautor INT NOT NULL,
    article INT NOT NULL,
    comment TEXT NOT NULL,
    cstatus ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    FOREIGN KEY (cautor) REFERENCES users (uid),
    FOREIGN KEY (article) REFERENCES articles (aid)
);

INSERT INTO comments (
    cautor,
    comment,
    article
) VALUES (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '2',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '3',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '4',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '3',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '6'
);

CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOt NULL,
    status ENUM('sended', 'readed', 'responded', 'deleted') DEFAULT 'sended'
);