-- Create first table: books
CREATE TABLE books (
	book_id bigserial PRIMARY KEY,
	title varchar(150),
	rating numeric(2,1)
		CONSTRAINT chk_book_rating
        CHECK (rating >= 0.5 
			AND rating <= 5.0 
			AND (rating % 0.5) = 0
		),
	completion_status VARCHAR(20) NOT NULL
        CHECK (completion_status IN ('Completed', 'Incomplete', 'In Progress'))
);
-- Notes: 
--	* Allow 0.5 <= ratings => 5.0, and rating% 0.5 allows only remainder 0.5 (.5, 1, 1.5, ...)



-- Create table: authors
CREATE TABLE authors (
	author_id bigserial PRIMARY KEY,
	last_name varchar(50) NOT NULL,
	display_name varchar(150) NOT NULL
);



-- Create table: genre
CREATE TABLE genres (
	genre_id bigserial PRIMARY KEY,
	genre_name varchar (25) NOT NULL UNIQUE
);



-- Create table: Reviews
CREATE TABLE reviews (
	review_id bigserial PRIMARY KEY,
	book_id bigint REFERENCES books(book_id),
	review_text text NOT NULL
);



-- Create Junction table: book_genres
CREATE TABLE book_genres (
	book_id bigint REFERENCES books(book_id) ON DELETE CASCADE,
	genre_id bigint REFERENCES genres(genre_id) ON DELETE CASCADE,
	PRIMARY KEY (book_id, genre_id)
);
-- Note: use REFERENCES when referring to another existing column in another table
-- Note: ON DELETE CASCADE auto deletes all related child table rows- so if I delete a book from the library, it will also remove genre connections



-- Create junction table: book_authors
CREATE TABLE book_authors (
	book_id bigint REFERENCES books (book_id) ON DELETE CASCADE,
	author_id bigint REFERENCES authors (author_id) ON DELETE CASCADE,
	PRIMARY KEY (book_id, author_id)
);



-- Create table: Series
CREATE TABLE series (
	series_id bigserial PRIMARY KEY,
	series_name varchar (150) NOT NULL UNIQUE
);



-- Create Junction table: Book Series
CREATE TABLE book_series (
	book_id bigint REFERENCES books(book_id) ON DELETE CASCADE,
	series_id bigint REFERENCES series (series_id) ON DELETE CASCADE,
	series_order numeric(4,1),
	PRIMARY KEY (book_id, series_id)
);
-- Note: numeric allows for books in series such as 1.5, up to 999.9 for extra long series