create database if not exists red_social;
use red_social;

create table users(
id int(255) auto_increment not null,
role varchar(20),
email varchar(255),
name varchar(255),
surname varchar(255),
password varchar(255),
nick varchar(50),
bio varchar(255),
active varchar(2),
image varchar(255),
constraint users_uniques_fields unique (email,nick),
constraint pk_users primary key(id)
)Engine = InnoDb;

create table publications(
id int(255) auto_increment not null,
user_id int(255),
text mediumtext,
document varchar(100),
image varchar(255),
status varchar(30),
created_at datetime,
constraint pk_publications primary key(id),
constraint fk_publications_users foreign key(user_id) references users(id)
)Engine = InnoDb;

create table following(
id int(255) auto_increment not null,
user int(255),
followed int(255),
constraint pk_following primary key(id),
constraint fk_following_users foreign key(user) references users(id),
constraint fk_followed foreign key(followed) references users(id)
)Engine = InnoDb;

create table private_messages(
id int(255) auto_increment not null,
mesagge longtext,
emitter int(255),
receiver int(255),
file varchar(200),
image varchar(255),
readed varchar(3),
created_at datetime,
constraint pk_private_messages primary key(id),
constraint fk_emitter_privates foreign key(emitter) references users(id),
constraint fk_receiver_privates foreign key(receiver) references users(id)
)Engine = InnoDb;

create table approbations(
id int(255) auto_increment not null,
user int(255),
publications int(255),
constraint pk_approbations primary key(id),
constraint fk_approbations_users foreign key(user) references users(id),
constraint fk_approbations_publications foreign key(publications) references publications(id)
)Engine = InnoDb;

create table notifications(
id int(255) auto_increment not null,
user_id int(255),
type varchar(255),
type_id int(255),
readed varchar(3),
created_at datetime,
extra varchar(100),
constraint pk_notifications primary key(id),
constraint fk_notifications_users foreign key(user_id) references users(id)
)Engine = InnoDb;