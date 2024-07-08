-- Using WHERE with numbers
-- Filtering with WHERE allows you to analyze your data better. You may have a dataset that includes a range of different movies, and you need to do a case study on the most notable films with the biggest budgets. In this case, you'll want to filter your data to a specific budget range.
-- Now it's your turn to use the WHERE clause to filter numeric values!

-- 1. Select the film_id and imdb_score from the reviews table and filter on scores higher than 7.0.
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;

-- 2. Select the film_id and facebook_likes of the first ten records with less than 1000 likes from the reviews table.
SELECT film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;

-- 3. Count how many records have a num_votes of at least 100,000; use the alias films_over_100K_votes.
SELECT COUNT(*) as films_over_100K_votes
FROM reviews 
WHERE num_votes >= 100000;

-- Using WHERE with text
-- WHERE can also filter string values.
-- Imagine you are part of an organization that gives cinematography awards, and you have several international categories. Before you confirm an award for every language listed in your dataset, it may be worth seeing if there are enough films of a specific language to make it a fair competition. If there is only one movie or a significant skew, it may be worth considering a different way of giving international awards.
-- Select and count the language field using the alias count_spanish.
-- Apply a filter to select only Spanish from the language field.
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- Using AND
-- The following exercises combine AND and OR with the WHERE clause. Using these operators together strengthens your queries and analyses of data.
-- You will apply these new skills now on the films table.
-- 1. Select the title and release_year for all German-language films released before 2000.
SELECT title, release_year
FROM films
WHERE language ='German' AND release_year<2000;

-- 2. Update the query from the previous step to show German-language films released after 2000 rather than before.
SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';

-- 3. Select all details for German-language films released after 2000 but before 2010 using only WHERE and AND.
SELECT *
FROM films
WHERE language ='German' AND release_year > 2000 AND release_year <2010;

-- Using OR
-- This time you'll write a query to get the title and release_year of films released in 1990 or 1999, which were in English or Spanish and took in more than $2,000,000 gross.
-- It looks like a lot, but you can build the query up one step at a time to get comfortable with the underlying concept in each step. Let's go!

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	AND gross > 2000000;

-- Using BETWEEN
-- Let's use BETWEEN with AND on the films database to get the title and release_year of all Spanish-language films released between 1990 and 2000 (inclusive) with budgets over $100 million.
-- We have broken the problem into smaller steps so that you can build the query as you go along!

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Amend the query to include Spanish or French-language films
	AND (language='Spanish' OR language = 'French');

-- LIKE and NOT LIKE
-- The LIKE and NOT LIKE operators can be used to find records that either match or do not match a specified pattern, respectively. They can be coupled with the wildcards % and _. The % will match zero or many characters, and _ will match a single character.
-- This is useful when you want to filter text, but not to an exact word.
-- Do the following exercises to gain some practice with these keywords.
-- 1. Select the names of all people whose names begin with 'B'.
SELECT name
FROM people
WHERE name LIKE 'B%'

-- 2. Select the names of people whose names have 'r' as the second letter.
SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%'

-- 3. Select the names of people whose names don't start with 'A'.
SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%'

-- WHERE IN
-- You now know you can query multiple conditions using the IN operator and a set of parentheses. It is a valuable piece of code that helps us keep our queries clean and concise.
-- Try using the IN operator yourself!

-- 1. Select the title and release_year of all films released in 1990 or 2000 that were longer than two hours.
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000) AND duration > 120

-- 2. Select the title and language of all films in English, Spanish, or French using IN.
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French')

-- 3. Select the title, certification and language of all films certified NC-17 or R that are in English, Italian, or Greek.
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R') AND language IN ('English', 'Italian', 'Greek');


-- Combining filtering and selecting
-- Time for a little challenge. So far, your SQL vocabulary from this course includes COUNT(), DISTINCT, LIMIT, WHERE, OR, AND, BETWEEN, LIKE, NOT LIKE, and IN. In this exercise, you will try to use some of these together. Writing more complex queries will be standard for you as you become a qualified SQL programmer.
-- As this query will be a little more complicated than what you've seen so far, we've included a bit of code to get you started. You will be using DISTINCT here too because, surprise, there are two movies named 'Hamlet' in this dataset!
-- Follow the instructions to find out what 90's films we have in our dataset that would be suitable for English-speaking teens.

    -- Count the unique titles from the films database and use the alias provided.
    -- Filter to include only movies with a release_year from 1990 to 1999, inclusive.
    -- Add another filter narrowing your query down to English-language films.
    -- Add a final filter to select only films with 'G', 'PG', 'PG-13' certifications.
-- Count the unique titles
SELECT COUNT( DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE (release_year BETWEEN 1990 AND 1999)
-- Filter to English-language films
	AND language='English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13') ;


-- Practice with NULLs
-- Well done. Now that you know what NULL means and what it's used for, it's time for some more practice!
-- Let's explore the films table again to better understand what data you have.


    -- 1. Select the title of every film that doesn't have a budget associated with it and use the alias no_budget_info.
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;

    -- 2. Count the number of films with a language associated with them and use the alias count_language_known.
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;