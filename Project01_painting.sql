use painting;

-- Q.1 Find the artist with the earliest birth year.?
 SELECT * FROM artist
ORDER BY birth LIMIT 1;

-- Q.2 All the artist from Franch and American nationality?

select * from artist
where nationality = 'French' or nationality = 'American';

-- Q.3 What are the dimensions of the canvas labeled '46" x 35"(117 cm x 89 cm)'?

SELECT width, height, label FROM canvas_size
WHERE label = '46" x 35"(117 cm x 89 cm)';

-- Q.4 How many paintings are associated with each museum with museum name?

SELECT m.museum_id, m.name, COUNT(work_id) AS total_painting FROM work
JOIN museum AS m ON work.museum_id = m.museum_id
GROUP BY museum_id , m.name
ORDER BY museum_id;

-- Q.5 List the full names of artists and the styles of paintings they created.
SELECT full_name, style FROM artist
ORDER BY full_name;

-- Q.6  Museums name that are Open on Sundays?

SELECT m.name, day, open FROM museum_hours AS mh
JOIN museum AS m ON mh.museum_id = m.museum_id
WHERE day = 'sunday';

-- Q.7 Most Common Painting Subject?

SELECT subject, COUNT(*) AS subject_count FROM subject
GROUP BY subject
ORDER BY subject_count DESC LIMIT 1;

-- Q.8  Top 5 High-Value Paintings?

SELECT work_id, regular_price FROM product_size
ORDER BY regular_price DESC
LIMIT 5;

-- Q.9 Museum with Most Paintings by a Nationality?

SELECT museum.museum_id, museum.name, artist.nationality, 
COUNT(work.work_id) AS painting_count FROM museum
JOIN work ON work.museum_id = museum.museum_id
JOIN artist ON artist.artist_id = work.artist_id
GROUP BY museum_id , name , artist.nationality
ORDER BY painting_count DESC;

-- Q.10 Average Sale Price by artist?
SELECT 
    full_name, AVG(ps.sale_price) AS avg_price
FROM artist
JOIN work ON artist.artist_id = work.work_id
JOIN product_size AS ps ON work.work_id = ps.work_id
GROUP BY full_name
ORDER BY avg_price DESC








 


