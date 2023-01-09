create database innocent;

USE innocent;

set @@global.time_zone = '+00:00' ;
set @@session.time_zone = '+00:00' ;

create table users
(
    username                varchar(15) not null
        primary key,
    firstname               varchar(30) not null,
    lastname                varchar(30) not null,
    password                varchar(60) not null,
    email                   varchar(30) not null,
    phone_number            varchar(13) null,
    address                 varchar(50) not null,
    authorities             varchar(15) default null,
    non_expired             bit         default null,
    non_locked              bit         default null,
    credentials_non_expired bit         default null,
    enabled                 bit         default null,
    constraint users_email_uindex
        unique (email)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

create table orders
(
    id         int auto_increment primary key,
    date       date        not null,
    is_paid    bit         not null,
    user       varchar(15) not null,
    constraint orders_users_username_fk
        foreign key (user) references users (username)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

create table categories
(
    id     varchar(20) not null primary key,
    name     varchar(20) not null,
    color    varchar(15) not null,
    bg_color varchar(15) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

create table articles
(
    id          varchar(30)   not null primary key,
    unit_price  decimal(4, 2) not null,
    capacity    varchar(10)   not null,
    ingredients varchar(500)  not null,
    category_id varchar(20)   not null,
    constraint article_categories_id_fk
        foreign key (category_id) references categories (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


create table order_lines
(
    id          int auto_increment primary key,
    unit_price  decimal(4, 2) not null,
    nb_articles int           not null,
    order_id    int           not null,
    article_id  varchar(30)   not null,
    constraint order_lines_articles_id_fk
        foreign key (article_id) references articles (id),
    constraint order_lines_orders_id_fk
        foreign key (order_id) references orders (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

create table languages
(
    id varchar(2) not null primary key
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

create table article_translations
(
    id          int auto_increment primary key,
    name        varchar(60) not null,
    article_id  varchar(30) not null,
    language_id varchar(2)  not null,
    constraint article_translations_articles_id_fk
        foreign key (article_id) references articles (id),
    constraint article_translations_languages_id_fk
        foreign key (language_id) references languages (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ---------- Remplissage tables ----------

-- categories

insert into categories values ('jus','Jus','red','pink');
insert into categories values ('smoothies','Smoothies','orange','yellow');
insert into categories values ('supersmoothies','Super smoothies','darkpurple','purple');
insert into categories values ('boissonsvegetales','Boissons végétales','darkturquoise','turquoise');

-- languages

insert into languages values ('fr');
insert into languages values ('en');

-- articles

insert into articles values ('dairynoisette',2.48,'1 L','Eau de source, riz (11%), noisettes (4,7%), algues lithothamnium calcaraeum et sel marin.','boissonsvegetales');
insert into articles values ('dairyamande',2.98,'1 L','Eau de source, amandes (4,5%), algues lithothamnium calcareum et sel marin.','boissonsvegetales');
insert into articles values ('dairycoco',2.98,'1 L','Eau de source, riz (11%), lait de coco (9,1%), algues lithothamnium calcareum, fibres végétales d''agrumes (0,30%) et sel marin.','boissonsvegetales');

insert into articles values ('coreananas',2.35,'25 cl','3,5 pommes pressées (55%), 1,5 banane écrasée, 6 fraises écrasées (8,8%), 1/2 ananas pressé (7,5%), 3/4 de carotte blanche pressée, 1 fruit de la passion écrasé, un zeste d''orange, une goutte de betterave pressée et un trait d''extrait de patate douce.','smoothies');
insert into articles values ('corefraise',2.35,'25 cl','21 fraises écrasées (31%), 1 1/2 pommes pressées, 2 bananes écrasées (22%), 31 raisins blancs pressés, 1/4 orange pressée, 17 cassis écrasés.','smoothies');
insert into articles values ('coremangue',2.35,'25 cl','3 1/2 pommes pressées, 1 1/2 mangues écrasées (16%), 1 1/2 bananes écrasées, 1 orange pressée, 3/4 fruit de la passion écrasé (3.0%), de la pêche écrasée, un filet de citron vert (0.43%).','smoothies');
insert into articles values ('corecoco',2.35,'25 cl','3/4 d''un ananas pressé (39 %), 3 1/2 bananes écrasées** (37 %), 1 pomme pressée, 1/3 d''orange pressée, du lait de coco onctueux (3,3 %), et un peu de jus de citron.','smoothies');
insert into articles values ('coregoyave',2.35,'25 cl','3 pommes pressées (46%), 2 bananes écrasées, 1/2 ananas pressé (19%), 1 goyave blanche écrasée (11%), 1/4 d''un citron pressé, 1/2 fruit de la passion écrasé et un filet d''extrait de spiruline.','smoothies');
insert into articles values ('corekiwi',2.35,'25 cl','2½ pommes pressées, ¾ d''ananas pressé, 1 kiwi écrasé , ¼ de citron vert pressé, 18 raisins blancs pressés, un peu d''extrait de spiruline et de carthame.','smoothies');

insert into articles values ('defencesitewebnew',3.09,'30 cl','4 pommes pressées (68%), 1 1/2 bananes écrasées, 3/4 mangue écrasée (11%), 1 fruit de la passion écrasé, du lait de coco onctueux (1.6%), 3 cerises acérolas écrasées, un filet de citron vert, un soupçon d''infusion au gingembre (0.26%), une pincée de fibres d''agrumes, des vitamines (B1, B2, B3, B6, C et E).','supersmoothies');
insert into articles values ('ssrecharge',2.75,'30 cl','4 1/2 pommes pressées (69%), 3 mandarines pressées (15%), 1/2 banane écrasée, 1/3 carotte pressée (4.5%), de la pêche écrasée, un filet de citron, un soupçon d''infusion au gingembre (0.41%), un soupçon d''extrait de carthame, Graines de lin (0.06%), des vitamines (B1, B2, B3, B6, C et E).','supersmoothies');
insert into articles values ('ssenergy',2.75,'30 cl','3 1/2 pommes pressées (50%), 33 raisins rouges pressés, 1 1/2 bananes écrasées, 7 fraises écrasées (10%), 34 cassis écrasés, 7 griottes écrasées (3.3%), un doigt de betterave pressée, Graines de lin (0.56%), des vitamines (B1, B2, B3, B6, C et E), un soupçon d''infusion de guarana (0.01%).','supersmoothies');
insert into articles values ('smoothievegitalise',2.75,'30 cl','2 1/2 pommes pressées (45 %), 2 poires mixées, un peu de betterave pressée (6,9 %), 1/3 de grenade pressée (6,4 %), 15 framboises mixées (4,6 %), 36 baies de cassis mixées, 8 canneberges écrasées (1,5 %), quelques graines de lin moulues (0,35 %), un peu de baobab écrasé (0,31 %), et quelques vitamines (B1, B2, B3, B6, C et E).','supersmoothies');
insert into articles values ('sssuperbleu',2.85,'30 cl','3 1/2 pommes pressées (53%), 1 1/2 bananes écrasées, 1/4 ananas pressé (9.3%), 1 goyave blanche écrasée (8.7%), de l''eau de coco, 1/2 carotte blanche pressée, 1/2 fruit de la passion écrasé, un soupçon d''extrait de spiruline (0.81%), un filet de citron vert, des vitamines (B3, B5, B6, B7, B9, B12 et C).','supersmoothies');
insert into articles values ('ssantioxidant',2.75,'30 cl','4 pommes pressées (61%), 1 banane écrasée, 19 raisins blancs pressés, 1/2 mangue écrasée,1/2 kiwi écrasé (6.1%),  un morceau de concombre écrasé (1.5%), Graines de lin (0.60%), un soupçon d''extrait de spiruline, un filet de citron vert (0.14%), un soupçon d''extrait de carthame, un soupçon de thé matcha (0.05%), des vitamines (B1, B2, B3, B6, C et E).','supersmoothies');

insert into articles values ('jusananas',2.99,'1 L','1 1/2 ananas pressés (100%).','jus');
insert into articles values ('jusfleurdesureau',3.25,'1 L','8 pommes pressées (98%), un soupçon d''infusion de baie de sureau (2.5%), un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('juslavande',3.25,'1 L','6 pommes pressées (89 %), 15 1/2 framboises écrasées (4,8 %), un peu d''eau de pomme, 16 1/2 baies de cassis mixées (1,7 %), un doigt de betterave pressée, et une lichette d''extrait de lavande (0,25 %).','jus');
insert into articles values ('jusmyrtille',3.25,'1 L','6 pommes pressées (73 %), 22 raisins blancs pressés (9,6 %), 79 baies de cassis pressées (6,7 %), 1/3 de poire mixée, 138 myrtilles pressées (4,3 %), 9 canneberges mixées (1,4 %) et un zeste de vitamine C.','jus');
insert into articles values ('jusorangecarotte',3.25,'1 L','8 1/2 oranges pressées (74%), 1 1/2 pommes pressées (16%), 1 carotte pressée (10.0%), un filet de citron, un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('jusorangemanguev3',3.29,'1 L','9 1/2 oranges pressées (86%), 1 1/2 mangues écrasées.','jus');
insert into articles values ('jusorangepassion',3.25,'1 L','3 1/2 pommes pressées (42 %), 7 mandarines pressées (27 %), 3 oranges pressées (26 %), 1 1/2 fruits de la passion écrasés (4,8 %), et un zeste de vitamine C.','jus');
insert into articles values ('jusorangesanguineV3',3.19,'1 L','10 oranges sanguines pressées (100%).','jus');
insert into articles values ('jusorangesspulpev3',2.95,'1 L','11 oranges pressées (100%)','jus');
insert into articles values ('juspomme',2.99,'1 L','8 pommes pressées (100%), un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('juspommefruitsrouge',3.25,'1 L','5 1/2 pommes pressées (69%), 34 raisins blancs pressés, 10 fraises écrasées (12%), 52 cassis écrasés (4.0%), un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('juspommekiwiconcombre',3.19,'1 L','6 1/2 pommes pressées (83%), ¾ d’un kiwi mixé (9%), ½ concombre écrasé (7,1%), une lichette de jus de citron, un peu de jus de citron vert (0,56%), un soupçon d’extraits de carthame et de spiruline et un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('jusrhubarbe',3.19,'1 L','5 pommes pressées (60%), 1  1/2 tiges de rhubarbe pressées (20%), 1 1/2 poires écrasées (19%), extrait de betterave et de carotte.','jus');
insert into articles values ('justuttifrutti',3.25,'1 L','4 oranges pressées (35%), 2 1/2 pommes pressées (28%), 34 raisins blancs pressés (15%), 1/4 d''ananas pressée (7.6%), 1/3 de carotte pressée (4.5%), 1/5 de pêche écrasée (3.6%), un morceau de mangue écrasée (1.8%), 1/2 fruit de la passion écrasé (1.7%), de la poire écrasée, (1.7%), un filet de citron (1.00%), un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('jusraisinpoiregrenade',3.25,'1 L','5 pommes pressés (65%), 34 raisins rouges pressés (15%), 19 framboises écrasées (5%), ¼ de grenade pressée (5%), 20 cassis pressés (2%), 3½ mûres pressées (2%), un peu de jus de citron, ⅓ poire pressé, un trait de jus de betterave.','jus');
insert into articles values ('juspommepeche',3.19,'1 L','5 1/2 pommes pressées (70%), 1 pêche écrasée (20%), 3/4 poire écrasée (10%), un soupçon d''antioxydant : acide ascorbique (vitamine C).','jus');
insert into articles values ('orangeclementine',2.99,'1 L','20 clémentines pressées (80%), 5 mandarines pressées (20%).','jus');
insert into articles values ('jusorangesanguinegrenade',3.25,'1 L','7 oranges pressées (65%), 1/2 grenade pressée (9.2%), 1/2 orange sanguine pressée (7.2%), 16 raisins blancs pressés, 1/3 de pomme pressée, 17 canneberges écrasées, un doigt de betterave pressée (1.9%), 1/3 de citron vert pressé (1.3%).','jus');

-- article translations

insert into article_translations values (null, 'noisette','dairynoisette','fr');
insert into article_translations values (null, 'hazelnut','dairynoisette','en');
insert into article_translations values (null, 'amande','dairyamande','fr');
insert into article_translations values (null, 'almond','dairyamande','en');
insert into article_translations values (null, 'coco','dairycoco','fr');
insert into article_translations values (null, 'coconut','dairycoco','en');

insert into article_translations values (null, 'ananas, fraise & pomme','coreananas','fr');
insert into article_translations values (null, 'pineapple, strawberry & apple','coreananas','en');
insert into article_translations values (null, 'fraise & banane','corefraise','fr');
insert into article_translations values (null, 'strawberry & banana','corefraise','en');
insert into article_translations values (null, 'mangue, fruits de la passion & pomme','coremangue','fr');
insert into article_translations values (null, 'mango, passion fruit & apple','coremangue','en');
insert into article_translations values (null, 'ananas, banane & coco','corecoco','fr');
insert into article_translations values (null, 'pineapple, banana & coconut','corecoco','en');
insert into article_translations values (null, 'goyave, ananas & pomme','coregoyave','fr');
insert into article_translations values (null, 'guava, pineapple & apple','coregoyave','en');
insert into article_translations values (null, 'kiwi, pomme & ananas','corekiwi','fr');
insert into article_translations values (null, 'kiwi, apple & pineapple','corekiwi','en');

insert into article_translations values (null, 'défense','defencesitewebnew','fr');
insert into article_translations values (null, 'defense','defencesitewebnew','en');
insert into article_translations values (null, 'recharge','ssrecharge','fr');
insert into article_translations values (null, 'recharge','ssrecharge','en');
insert into article_translations values (null, 'énergie','ssenergy','fr');
insert into article_translations values (null, 'energy','ssenergy','en');
insert into article_translations values (null, 'revitalisant','smoothievegitalise','fr');
insert into article_translations values (null, 'revitalise','smoothievegitalise','en');
insert into article_translations values (null, 'super bleu','sssuperbleu','fr');
insert into article_translations values (null, 'super blue','sssuperbleu','en');
insert into article_translations values (null, 'antioxydant','ssantioxidant','fr');
insert into article_translations values (null, 'antioxidant','ssantioxidant','en');

insert into article_translations values (null, 'ananas gold','jusananas','fr');
insert into article_translations values (null, 'gold pineapple','jusananas','en');
insert into article_translations values (null, 'pomme et fleur de sureau','jusfleurdesureau','fr');
insert into article_translations values (null, 'apple and elderflower','jusfleurdesureau','en');
insert into article_translations values (null, 'framboise, cassis, pomme et twist de lavande','juslavande','fr');
insert into article_translations values (null, 'raspberry, blackcurrant, apple and twist of lavender','juslavande','en');
insert into article_translations values (null, 'myrtille, cassis, pomme et cranberry','jusmyrtille','fr');
insert into article_translations values (null, 'blueberry, blackcurrant, apple and cranberry','jusmyrtille','en');
insert into article_translations values (null, 'orange et carotte','jusorangecarotte','fr');
insert into article_translations values (null, 'orange and carrot','jusorangecarotte','en');
insert into article_translations values (null, 'orange et mangue','jusorangemanguev3','fr');
insert into article_translations values (null, 'orange and mango','jusorangemanguev3','en');
insert into article_translations values (null, 'orange, fruit de la passion & mandarine','jusorangepassion','fr');
insert into article_translations values (null, 'orange, passion fruit & tangerine','jusorangepassion','en');
insert into article_translations values (null, 'orange sanguine','jusorangesanguineV3','fr');
insert into article_translations values (null, 'blood orange','jusorangesanguineV3','en');
insert into article_translations values (null, 'orange sans pulpe','jusorangesspulpev3','fr');
insert into article_translations values (null, 'orange without pulp','jusorangesspulpev3','en');
insert into article_translations values (null, 'pomme','juspomme','fr');
insert into article_translations values (null, 'apple','juspomme','en');
insert into article_translations values (null, 'pomme et fruits rouges','juspommefruitsrouge','fr');
insert into article_translations values (null, 'apple and berries','juspommefruitsrouge','en');
insert into article_translations values (null, 'pomme kiwi concombre','juspommekiwiconcombre','fr');
insert into article_translations values (null, 'apple kiwi cucumber','juspommekiwiconcombre','en');
insert into article_translations values (null, 'rhubarbe, pomme et poire','jusrhubarbe','fr');
insert into article_translations values (null, 'rhubarb, apple and pear','jusrhubarbe','en');
insert into article_translations values (null, 'tutti frutti','justuttifrutti','fr');
insert into article_translations values (null, 'tutti frutti','justuttifrutti','en');
insert into article_translations values (null, 'pomme, raisin, poire et grenade','jusraisinpoiregrenade','fr');
insert into article_translations values (null, 'apple, grape, pear and pomegranate','jusraisinpoiregrenade','en');
insert into article_translations values (null, 'pomme, pêche et poire','juspommepeche','fr');
insert into article_translations values (null, 'apple, peach and pear','juspommepeche','en');
insert into article_translations values (null, 'clémentine et mandarine avec pulpe','orangeclementine','fr');
insert into article_translations values (null, 'clementine and tangerine with pulp','orangeclementine','en');
insert into article_translations values (null, 'orange sanguine, grenade, orange & citron vert','jusorangesanguinegrenade','fr');
insert into article_translations values (null, 'blood orange, pomegranate, orange & lime','jusorangesanguinegrenade','en');

-- users

insert into users (username, firstname, lastname, password, email, phone_number, address, authorities,
                            non_expired, non_locked, credentials_non_expired, enabled)
values ('babette','Elisabeth','Nyssens','$2a$10$p6eWvzypv6youbWFQiYaBe./5eDEbFNEWp.KUfOrmRi/VQ0jw/8L2','elisabethnyssens@gmail.com','0495484848','Rue de Gembloux 108, 5000 Namur','ROLE_ADMIN',1,1,1,1);

insert into users (username, firstname, lastname, password, email, phone_number, address, authorities,
                            non_expired, non_locked, credentials_non_expired, enabled)
values ('prof','Françoise','Dubisy','$2a$10$ynqq4faCEAoxxJClO50qX.SqehWXdlDlbaCw.f8qbESX4JpsFzOlC','francoisedubisy@gmail.com','0498191919','Rue Somlette 21, 5590 Ciney','ROLE_ADMIN',1,1,1,1);

insert into users (username, firstname, lastname, password, email, phone_number, address, authorities,
                            non_expired, non_locked, credentials_non_expired, enabled)
values ('jukru','Juliette','Krug','$2a$10$GVFQnQf7n7GTqOS7LUI2yOJzkTmYaLRcUiZ4rmbyFN9GLFJ6vfnMC','juliettekrug@gmail.com','0496323232','Rue de l''eau 6, 1325 Chaumont-Gistoux','ROLE_USER',1,1,1,1);