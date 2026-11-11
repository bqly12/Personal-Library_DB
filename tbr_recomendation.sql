-- =============================================
-- Next to read in TBR list
-- =============================================
-- Query acts as a recommendation queue and ranks books you should read next based on genre

-- Step 1: calc avg ratings per genre based on books that have been read
WITH genre_pref AS (
	SELECT
		g.genre_id,
		g.genre_name,
		ROUND(AVG(b.rating)::numeric, 2) AS avg_genre_rate,
		COUNT(b.book_id) AS completed_books
	FROM genres g
	JOIN book_genres bg ON g.genre_id= bg.genre_id
	JOIN books b ON bg.book_id= b.book_id
	WHERE b.completion_status= 'Completed'
	GROUP BY g.genre_id, g.genre_name
),
-- Note: Type-casting "::" treats the review result as a numeric value, rounding to "2" decimal points
-- Note: Count will count books and tell us how many books go into these average scores
	-- Ex.) 5 books in genre a avg= 4.6, 1 book in genre b avg= 5

-- Step 2: select books in TBR list and notes the id, title, and genres through junction table
TBR_log AS (
    SELECT 
        b.book_id,
        b.title AS book_title,
        bg.genre_id
    FROM books b
    JOIN book_genres bg ON b.book_id= bg.book_id
    WHERE b.completion_status= 'Incomplete'
)

-- Step 3: Combine into a reading queue (what to read next)
SELECT
	gp.genre_name,
	tbr.book_title,
	gp.avg_genre_rate
FROM TBR_log tbr
JOIN genre_pref gp ON tbr.genre_id= gp.genre_id
ORDER BY gp.avg_genre_rate DESC, gp.completed_books DESC;
-- Note: Sort by rating first, descending
-- Note: If there is a tie in rating, sort by which genre has more completed books (books read in genre), descending
