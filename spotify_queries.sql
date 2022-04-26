
-- Phase 3: Query Database
use spotify;

-- 1. pulls the rating scores for each playlist and the user who created it *****dont get this

select * from song;
select * from song_review;

SELECT sg.song_id, title, performer_id, round(AVG(rating), 1) as avg_rating
FROM `song` AS sg
	JOIN `song_review` AS sgr
    ON sg.song_id = sgr.`song_id`
GROUP BY sg.song_id, rating
ORDER BY rating desc;

-- 2. pulls the average rating of each playlist 

SELECT pl.playlist_id, title, user_name, round(AVG(rating), 1) as avg_rating
FROM `playlist` AS pl
	JOIN `playlist_review` AS plr
    ON pl.playlist_id = plr.`playlist_id`
    JOIN `user` as us
    ON pl.`user_id` = us.user_id
GROUP BY pl.playlist_id, us.user_id, rating
ORDER BY rating desc;

-- 3. pulls the number of playlists created by each user

SELECT us.user_id, user_name, Count(DISTINCT(`playlist_id`)) AS "Number of Playlist Created"
FROM `user` AS us
	LEFT JOIN `playlist` AS pl
    ON us.`user_id` = pl.`user_id`
GROUP BY user_id
ORDER BY Count(DISTINCT(`playlist_id`)) desc;

-- 4. Number of reviews written by users 

SELECT us.user_id, user_name, num_songs_reviewed, num_playlists_reveiewed, 
		(num_songs_reviewed + num_playlists_reveiewed) AS total_reviews
FROM `user` AS us
	LEFT JOIN (
    SELECT song_review.user_id, COUNT(*) AS num_songs_reviewed
    FROM song_review
    GROUP BY user_id
    ) AS song_counts
    ON us.user_id = song_counts.user_id
	LEFT JOIN (
    SELECT playlist_review.user_id, COUNT(*) AS num_playlists_reveiewed
    FROM playlist_review
    GROUP BY user_id
    ) AS playlist_counts
    ON us.user_id = playlist_counts.user_id
ORDER BY num_playlists_reveiewed, num_songs_reviewed;

-- 5. For each user that created a playlist, what was the min, max, and avg rating for their playlist

SELECT user_name, title, MIN(rating) as min_rating, MAX(rating) as max_rating, round(AVG(rating), 1) as avg_rating
FROM playlist_review as plr
	JOIN playlist as pl
    ON plr.user_id = pl.user_id
    JOIN user as us
    ON plr.user_id = us.user_id
group by user_name, title
order by avg_rating desc;

-- 6. count the number of times a performer is in a playlist, which performers show up the most in any playlist

select playlist_id, p.title, performer, count("performer") as performer_count
from playlist_song 
	join song using (song_id)
	join performer using (performer_id)
    join playlist as p using (playlist_id)
group by playlist_id, title, performer
order by count("performer") desc;


-- 7. count the number of songs in a playlist, showing owner

select playlist_id, user_name, count(song_id)
from playlist_song
	left join playlist using (playlist_id)
    left join user using (user_id)
group by playlist_id, user_name;

-- 8. What songs have the greatest difference between spotify ratings and user ratings 

select song_id, title, round(popularity_rating/10, 1) as spotify_rating, 
	pr.rating, abs(round(popularity_rating/10, 1) - pr.rating) as rating_difference
from song
	left join popularity using (song_id)
    left join song_review  using (song_id)
    left join user using (user_id)
    left join playlist_review as pr using (user_id)
where pr.rating is not NULL
order by rating_difference desc;

-- 9. Which user likes the highest tempo music

select user_name, avg(tempo) as avg_tempo
from song
	left join technicals using (song_id)
    left join playlist_song using (song_id)
    left join playlist using (playlist_id)
    left join user using (user_id)
where playlist_id is not NULL
group by user_name
order by avg_tempo desc;

-- 10. Which playlist is the longest

select playlist_id, sum(duration_mins) as playlist_length
from song
	left join technicals using (song_id)
    left join playlist_song using (song_id)
    left join playlist using (playlist_id)
where playlist_id is not NULL
group by playlist_id
order by playlist_length desc;

-- 11. Which user listens to the most podcasts?

select user_name, count(pod.title) as pod_count
from user
	join playlist using (user_id)
	join playlist_podcast using (playlist_id)
    join podcast as pod using (podcast_id)
group by user_name
order by user_name;

-- 12. Who listened to the most songs by a single performer?

select * from song_review;

select user_name, max(performer_count) as most_listened_performer
from (
	select user_name, performer, count(performer) as performer_count
	from song
		left join performer using (performer_id)
		left join playlist_song using (song_id)
		left join playlist using (playlist_id)
		left join user using (user_id)
	where playlist_id is not NULL
	group by user_name, playlist_id, performer) as count_performer
group by user_name
order by most_listened_performer desc;






















