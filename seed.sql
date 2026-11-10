-- Test Data: Books
INSERT INTO books (title, rating, completion_status)
VALUES
	('Harry Potter and the Sorcerer''s Stone', 4.5, 'Completed'),
	('Harry Potter and the Chamber of Secrets', 4, 'Completed'),
	('Harry Potter and the Prisoner of Azkaban', 4.5, 'Completed'),
	('The Cruel Prince', 4, 'Completed'),
	('The Lost Sisters', NULL, 'Incomplete'),
	('The Wicked King', 4.5, 'Completed'),
	('The Queen of Nothing', 5, 'Completed'),
	('How the King of Elfhame Learned to Hate Stories', NULL, 'In Progress'),
	('1984', NULL, 'Incomplete'),
	('Pride and Prejudice', 4, 'Completed'),
	('The Great Gatsby', 3.5, 'Completed'),
	('To Kill a Mockingbird', NULL, 'Incomplete'),
	('Frankenstein', 3.5, 'Completed'),
	('Good Omens', NULL, 'Incomplete'),
	('The Talisman', 2.5, 'Completed'),
	('Sleeping Beauties', 3, 'Completed'),
	('The Odyssey', 3.5, 'Completed'),
	('The Republic', NULL, 'Incomplete'),
	('Project Hail Mary', 5, 'Completed'),
	('The Martian', NULL, 'In Progress')
;
	

-- Data: authors
INSERT INTO authors (last_name, display_name)
VALUES
	('Rowling', 'J.K. Rowling'),
	('Black', 'Holly Black'),
	('Orwell', 'George Orwell'),
	('Austen', 'Jane Austen'),
	('Fitzgerald', 'F. Scott Fitzgerald'),
	('Lee', 'Harper Lee'),
	('Shelley', 'Mary Shelley'),
	('Gaiman', 'Neil Gaiman'),
	('Pratchett', 'Terry Pratchett'),
	('King', 'Stephen King'),
	('Straub', 'Peter Straub'),
	('King', 'Owen King'),
	('Homer', 'Homer'),
	('Plato', 'Plato'),
	('Weir', 'Andy Weir')
;


-- Test data: Genres
INSERT INTO genres (genre_name)
VALUES
	('Fantasy'),
	('Sci-Fi'),
	('Classics'),
	('YA'),
	('Dystopian'),
	('Romance'),
	('Fiction'),
	('Historical Fiction'),
	('Comedy'),
	('Horror'),
	('Adventure'),
	('Philosophy'),
	('Literary Fiction')
;


-- Data: Series
INSERT INTO series (series_name)
VALUES
	('Harry Potter'),
	('The Folk of The Air')
;


-- Data junction: book_authors
INSERT INTO book_authors (book_id, author_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 3),
	(10, 4),
	(11, 5),
	(12, 6),
	(13, 7),
	(14, 8),
	(14, 9),
	(15, 10),
	(15, 11),
	(16, 10),
	(16, 12),
	(17, 13),
	(18, 14),
	(19, 15),
	(20, 15)
;


-- Data junction: book_genres
INSERT INTO book_genres (book_id, genre_id)
VALUES
	(1, 1),
	(1, 4),
	(1, 7),
	(1, 11),
	(2, 1),
	(2, 4),
	(2, 7),
	(2, 11),
	(3, 1),
	(3, 4),
	(3, 7),
	(4, 1),
	(4, 4),
	(4, 6),
	(4, 7),
	(5, 1),
	(5, 4),
	(5, 6),
	(5, 7),
	(6, 1),
	(6, 4),
	(6, 6),
	(6, 7),
	(7, 1),
	(7, 4),
	(7, 6),
	(7, 7),
	(8, 1),
	(8, 4),
	(8, 7),
	(9, 2),
	(9, 3),
	(9, 5),
	(9, 7),
	(10, 3),
	(10, 6),
	(10, 7),
	(10, 8),
	(11, 3),
	(11, 7),
	(11, 8),
	(12, 3),
	(12, 7),
	(12, 8),
	(12, 13),
	(13, 2),
	(13, 3),
	(13, 7),
	(13, 10),
	(14, 1),
	(14, 7),
	(14, 9),
	(15, 1),
	(15, 7),
	(15, 10),
	(16, 1),
	(16, 7),
	(16, 10),
	(17, 1),
	(17, 3),
	(17, 7),
	(17, 11),
	(18, 12),
	(19, 2),
	(19, 7),
	(20, 2),
	(20, 7)
;


-- Data junction: book_series
INSERT INTO book_series (book_id, series_id, series_order)
VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 1),
	(5, 2, 1.5),
	(6, 2, 2),
	(7, 2, 3),
	(8, 2, 3.5)
;