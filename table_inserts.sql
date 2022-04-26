use spotify;

select * from song;
select * from genre;
select * from performer;
select * from user;
select * from playlist;
select * from playlist_review;
select * from playlist_song;
select * from song_review;
select * from popularity;
select * from technicals;
select * from podcast;
select * from playlist_podcast;


-- user

insert into user (user_id, user_name, email)
values (1, "mark", "mark11@gmail.com");

insert into user (user_id, user_name, email)
values (2, "dan", "dan29@gmail.com");

insert into user (user_id, user_name, email)
values (3, "eric", "eric57@gmail.com");

insert into user (user_id, user_name, email)
values (4, "richard", "richard3@gmail.com");

insert into user (user_id, user_name, email)
values (5, "will", "will313@gmail.com");

select * from user;

-- playlist

insert into playlist 
	(playlist_id, title, user_id)
values 
	(1, "bangers", 1),
    (2, "electronic", 2),
    (3, "rock and roll", 2),
    (4, "rock", 1),
    (5, "electro", 3),
    (6, "pop", 2),
    (7, "rap", 4),
    (8, "funky fresh", 1),
    (9, "pop rock", 2),
    (10, "latin", 4),
    (11, "gym", 3),
    (12, "intense workout", 4);

select * from playlist order by user_id desc;


-- song_review REDO DESCRIPTIONS FOR CURRENT AND ADD A BUNCH MORE RANDOMS WITH NO DESCRIP

insert into song_review 
	(song_id, user_id, rating, description)
values 
	(2, 1, 7, "really decent song"),
    (2, 5, 9, "song of the year"),
    (2, 4, 2, "JB is a plague"),
    (2, 3, 4, "catchy but not for me"),
	(777, 1, 10, ""),
    (777, 5, 8, ""),
    (777, 4, 3, ""),
    (777, 3, 3, ""),
    (27, 1, 10, "BOP"),
    (1291, 1, 3, "Not my cup of tea"),
    (684, 1, 1, ""),
    (476, 1, 5, ""),
    (1118, 3, 6, "solid message"),
    (75, 3, 9, "incredible"),
    (885, 3, 8, "noice"),
	(132, 3, 7, ""),
    (187, 3, 10, ""),
    (109, 4, 2, "donkey describes this best"),
    (21, 4, 6, ""),
    (751, 4, 3, ""),
    (365, 4, 2, "bleh"),
    (401, 4, 9, "winner winner"),
    (578, 4, 7, ""),
    (1338, 4, 8, ""),
    (1320, 4, 6, ""),
    (1, 5, 3, "Cant say I love this"),
    (287, 5, 8, "A bop"),
	(442, 5, 3, ""),
    (645, 5, 8, ""),
	(1032, 5, 5, ""),
    (1222, 5, 10, ""),
	(17, 5, 1, ""),
    (56, 5, 7, ""),
	(243, 5, 2, ""),
    (751, 5, 8, "");

select * from song_review order by song_id desc;


-- playlist_song THINK THESE ARE FINE? ADD SOME MORE NO DESCRIP 

insert into playlist_review
	(playlist_id, user_id, rating, description)
values 
	(1, 1, 9, "Fantastic tase"),
    (1, 2, 7, ""),
    (1, 3, 2, ""),
    (1, 4, 5, "sure"),
    (1, 5, 3, ""),
    (2, 1, 1, "absolutely not it"),
    (3, 1, 8, ""),
    (3, 2, 1, "not elctronic?"),
    (9, 2, 10, ""),
    (11, 2, 5, ""),
    (6, 3, 1, ""),
    (11, 4, 8, "pretty great"),
    (8, 4, 3, "swing and a miss"),
    (10, 4, 6, "something to put on"),
    (2, 5, 2, ""),
    (5, 5, 2, ""),
    (10, 5, 2, "who listens to this?");

select * from playlist_review order by rating desc;


-- playlist_song 

insert into 
	playlist_song (playlist_id, song_id)
values 
	(1, 5), (1, 72), (1, 888), (1, 523), (1, 723), (1, 432), (1, 1082), (1, 1254),
    (2, 62), (2, 5), (2, 240), (2, 885), (2, 1225),
    (3, 59), (3, 137), (3, 221), (3, 1239), (3, 1099), (3, 613), (3, 255),
    (4, 76), (4, 137), (4, 59), (4, 142), (4, 1099), (4, 358), (4, 902), (4, 1058), (4, 873), (4, 693),
    (12, 1044), (12, 167), (12, 202), (12, 187), (12, 601),
    (5, 2), (5, 126), (5, 6), (5, 17), (5, 25), (5, 101),
    (6, 7), (6, 1199), (6, 1213), (6, 880), (6, 583), (6, 569), (6, 298), (6, 92), (6, 144),
    (7, 167), (7, 1366), (7, 177), (7, 1034), (7, 1035), (7, 895), (7, 783),
    (8, 311), (8, 338), (8, 849), (8, 1391), (8, 219),
    (9, 24), (9, 246), (9, 454), (9, 609), (9, 1080), (9, 484),
    (10, 401), (10, 43), (10, 1376), (10, 795), (10, 273), (10, 1120), (10, 310),
    (11, 798), (11, 44), (11, 894), (11, 459), (11, 5), (11, 102);
    
select * from playlist_song;


-- podcast 

insert into 
	podcast (podcast_id, title, host, episode, duration_mins)
values 
	(1, "MJ | Icons Club", "Jackie MacMullan", 4, 59),
    (2, "Dua Lipa: At Your Service", "Dua Lipa", 2, 37),
    (3, "Shaq and Kobe | Icons Club", "Jackie MacMullan", 7, 64),
    (4, "Pop Culture Happy Hour", "Linda Holmes", 24, 44),
    (5, "XXXTENTACION Freddy vs Jason", "Markus Ranki", 1, 99),
    (6, "Fresh Era", "Stupid Fly", 12, 34),
    (7, "Peak 2000s", "Sydnee Washington", 7, 30),
    (8, "The Big Hit Show", "Alex Pappademas", 2, 45),
    (9, "The Big Hit Show", "Alex Pappademas", 5, 47),
    (10, "The Big Hit Show", "Alex Pappademas", 9, 52);

select * from podcast;

-- playlist_podcast

select * from playlist;
select * from podcast;

insert into 
	playlist_podcast (playlist_id, podcast_id)
values 
	(3, 8),
    (3, 9),
    (9, 2),
    (6, 4),
    (6, 2),
    (12, 1),
    (12, 3),
    (1, 5),
    (8, 6);

select * from playlist_podcast;



