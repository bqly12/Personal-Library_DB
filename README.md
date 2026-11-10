# Personal Library Relational Database

A PostgreSQL database built to track and manage a personal physical book collection, using relational modeling to handle complex cases in organization such as co-authors and series numbering. The database sets the foundation for an analytical pipeline gather reading data, generate insights, and track reading habits.


## Project Roadmap

- [x] **Phase 1: Relational Database Schema (`schema.sql`)**
  - Designed a normalized schema with custom constraints, foreign keys, and junction tables for co-authorship and series.
- [x] **Phase 2: Database Seeding (`seed.sql`)**
  - Populated the database with a 20-book seed dataset featuring edge cases (mononymous authors, fractional series sequencing).
- [ ] **Phase 3: Python & Pandas Analytical Pipeline**
  - Extract and transform SQL data into Pandas DataFrames to perform statistical reporting on reading habits and collection metrics.
- [ ] **Phase 4: Client Application & Database Integration**
  - Build a custom application interface on my device to sequence directly with the PostgreSQL database for seamless book logging and updating.


## Schema Overview
- **`books`**: Core entity with books, completion statuses, and ratings.
- **`authors`**: Independent author table
- **`genres`**: Multi-tag genre lookup table.
- **`series`**: Series table handling fractional numbering
- **`reviews`**: Table including text entries to allow multiple reviews and notes to be made for each book
- **Junction Tables**: `book_authors`, `book_genres`, and `book_series` to manage many-to-many relationships.