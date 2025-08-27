---
layout: 421
title: Teaching 
permalink: /421_f25/lectures/sql
---

# Overview

Today, we'll learn basic/advanced SQL by poking at some [IMDb data](https://www.imdb.com/interfaces/). We'll see how many exercises we can get through in class.  The rest are left to the reader as good practice for a future exam.  No grading here, please work with those around you.

# Specification

Examing the following IMDb schema, then try to complete the exercises using sqlite3.  To work on this, please use the devcontainer from [Bootcamp 1](https://github.com/bsb20/421-bootcamp).  You will look in `./sql` to get started.

We'll use a random sample of the full IMDb.  If you are curious, the full dataset is [here](https://pypi.org/project/imdb-sqlite/).

## Getting Started
From the `./sql` directory, setup the database, then check the contents of the database by running the `.tables` command on the `sqlite3` terminal. You should see **6 tables**, and the output should look like this:
  <pre>
$ sqlite3 imdb-cmudb2022.db < setup.sql
$ sqlite3 imdb-cmudb2022.db
SQLite version 3.31.1
Enter ".help" for usage hints.
sqlite> .tables
akas      crew      episodes  people    ratings   titles</pre>

Our setup script creates the following indexes for you:
  <pre>
CREATE INDEX ix_people_name ON people (name);
CREATE INDEX ix_titles_type ON titles (type);
CREATE INDEX ix_titles_primary_title ON titles (primary_title);
CREATE INDEX ix_titles_original_title ON titles (original_title);
CREATE INDEX ix_akas_title_id ON akas (title_id);
CREATE INDEX ix_akas_title ON akas (title);
CREATE INDEX ix_crew_title_id ON crew (title_id);
CREATE INDEX ix_crew_person_id ON crew (person_id);</pre>

Without these, your queries would run super slow.  Why? *Keep coming to class*.

## Check the schema

Get familiar with the schema (structure) of the tables (what attributes do they contain, what are the primary and foreign keys). Run the `.schema $TABLE_NAME` command on the `sqlite3` terminal for each table. The output should look like the example below for each table.

### PEOPLE
<pre>
sqlite> .schema people
CREATE TABLE people (
  person_id VARCHAR PRIMARY KEY,
  name VARCHAR,
  born INTEGER,
  died INTEGER
);
CREATE INDEX ix_people_name ON people (name);
</pre>

Contains details for a person. For example, this is a row from the table:
<pre>
nm0000006|Ingrid Bergman|1915|1982
</pre>

To breakdown the row, the field `person_id` corresponds to "nm0000006", `name` corresponds to "Ingrid Bergman", `born` corresponds to "1915", and `died` corresponds to "1982".

### TITLES
<pre>
sqlite> .schema titles
CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY,
  type VARCHAR,
  primary_title VARCHAR,
  original_title VARCHAR,
  is_adult INTEGER,
  premiered INTEGER,
  ended INTEGER,
  runtime_minutes INTEGER,
  genres VARCHAR
);
CREATE INDEX ix_titles_type ON titles (type);
CREATE INDEX ix_titles_primary_title ON titles (primary_title);
CREATE INDEX ix_titles_original_title ON titles (original_title);
</pre>

Contains details of a title. For example, this is a row from the table:
<pre>
tt0088763|movie|Back to the Future|Back to the Future|0|1985||116|Adventure,Comedy,Sci-Fi
</pre>

For this assignment, we will focus on the fields `title_id` (e.g. "tt0088763"), `type` (e.g. "movie"), `primary_title` (e.g. "Back to the Future"), `premiered` (e.g. "1985"), and `genres` (e.g. "Adventure,Comedy,Sci-Fi").

Titles may also be referred to as "works" in the assignment specification.

### AKAS
<pre>
sqlite> .schema akas
CREATE TABLE akas (
  title_id VARCHAR, -- REFERENCES titles (title_id),
  title VARCHAR,
  region VARCHAR,
  language VARCHAR,
  types VARCHAR,
  attributes VARCHAR,
  is_original_title INTEGER
);
CREATE INDEX ix_akas_title_id ON akas (title_id);
CREATE INDEX ix_akas_title ON akas (title);
</pre>

This table contains the alternate titles for the dubbed movies. Note that `title_id` in this table corresponds to `title_id` in titles. For example, this is a row in the table:
<pre>
tt0015648|El acorazado Potemkin|XSA|es|imdbDisplay||0
</pre>

For this assignment, we will not use the fields `region`, `types`, `attributes` or `is_original_title`.

Note that title_id in this table corresponds to title_id in titles.

### CREW
<pre>
sqlite> .schema crew
CREATE TABLE crew (
  title_id VARCHAR, -- REFERENCES titles (title_id),
  person_id VARCHAR, -- REFERENCES people (person_id),
  category VARCHAR,
  job VARCHAR,
  characters VARCHAR
);
CREATE INDEX ix_crew_title_id ON crew (title_id);
CREATE INDEX ix_crew_person_id ON crew (person_id);
</pre>

Contains the details of the cast of the title. For example, this is a row from the table:
<pre>
tt0000886|nm0609814|actor||["Hamlet"]
</pre>

For this assignment, we will not use the fields `job` or `characters`. When considering the role of an individual on the crew, refer to the field `category`.

Note that title_id corresponds to title_id in titles and person_id corresponds to person_id in people.

### RATINGS
<pre>
sqlite> .schema ratings
CREATE TABLE ratings (
  title_id VARCHAR PRIMARY KEY, -- REFERENCES titles (title_id),
  rating FLOAT,
  votes INTEGER
);
</pre>

Contains the ratings for each title. For example, this is a row from the table:
<pre>
tt0000803|6.0|8
</pre>

Note that title_id in this table corresponds to title_id in titles.

### EPISODES

While the table `episodes` is included in our sample dataset, you should not need to reference this table.

### Sanity Check
Count the number of rows in the `titles` table

<pre>
sqlite> select count(*) from titles;
1375462
</pre>

<!-- This schema was generated by dbdiagram.io: https://dbdiagram.io/d/630d0b650911f91ba5ed211e -->
<p align="center">
<img src="../files/schema2022.png" alt="schema" width="800" style="max-width: 100%;">
</p>

## Construct the SQL Queries

Now, it's time to start constructing the SQL queries and put them into the placeholder files.

<div class="question">
    <h3>Q1 [0 points] (q1_sample):</h3> The purpose of this query is to make sure
    that the formatting of your output matches exactly the formatting of our auto-grading script.

    <p><b>Details:</b> List all Category Names ordered alphabetically. </p>

    <p><b>Answer</b>: Here's the correct SQL query and expected output:
<pre>
sqlite> SELECT DISTINCT(language)
   ...> FROM akas
   ...> ORDER BY language
   ...> LIMIT 10;

af
ar
az
be
bg
bn
bs
ca
cmn
</pre>
</p>
Check your solution.  Run our grading script using

`./check.py q1_sample`

The answers to these questions are not well hidden.  Don't look up the answers, this is just for practice.
</div>

## Ok your turn...

<div class="question">
  <h3>Q2 (q2_sci_fi):</h3>
  Find the 10 `Sci-Fi` works with the longest runtimes.
  <p><b>Details:</b>
  Print the title of the work, the premiere date, and the runtime.
  The column listing the runtime should be suffixed with the string " (mins)",
  for example, if the <code>runtime_mins</code> value is `12`, you should output <code>12 (mins)</code>.
  Note a work is <code>Sci-Fi</code> even if it is categorized in multiple genres,
  as long as <code>Sci-Fi</code> is one of the genres.<br/>
  Your first row should look like this:
  <code>Cicak-Man 2: Planet Hitam|2008|999 (mins)</code>
  </p>
</div>

<div class="question">
  <h3>Q3 (q3_oldest_people):</h3>
  Determine the oldest people in the dataset who were born in or after 1900.
  You should assume that a person without a known death year is still alive.
  <p><b>Details:</b>
  Print the name and age of each person. People should be
  ordered by a compound value of their age and secondly their name in
  alphabetical order. Return the first 20 results.<br/>
  Your output should have the format:
  <code>NAME|AGE</code>
  </p>
</div>

<div class="question">
  <h3>Q4 (q4_crew_appears_most):</h3>
  Find the people who appear most frequently as crew members.
  <p><b>Details:</b>
  Print the names and number of appearances of the 20 people
  with the most crew appearances ordered by their number of appearances
  in a descending fashion.<br/>
  Your output should look like this:
  <code>NAME|NUM_APPEARANCES</code>
  </p>
</div>

<div class="question">
  <h3>Q5 (q5_decade_ratings):</h3>
  Compute intersting statistics on the ratings of content on a per-decade basis.
  <p><b>Details:</b>
  Get the average rating (rounded to two decimal places), top rating,
  min rating, and the number of releases in each decade. Exclude titles which
  have not been premiered (i.e. where premiered is <code>NULL</code>). Print the relevant
  decade in a fancier format by constructing a string that looks like this:
  <code>1990s</code>. Order the decades first by their average rating in a descending
  fashion and secondly by the decade, ascending, to break ties.<br/>
  Your output should have the format:
  <code>DECADE|AVG_RATING|TOP_RATING|MIN_RATING|NUM_RELEASES</code>
  </p>
</div>

<div class="question">
  <h3>Q6 (q6_cruiseing_altitude):</h3>
  Determine the most popular works with a person who has "Cruise" in their
  name and is born in 1962.
  <p><b>Details:</b>
  Get the works with the most votes that have a person in the crew
  with "Cruise" in their name who was born in 1962. Return both the name of the
  work and the number of votes and only list the top 10 results in order from
  most to least votes. Make sure your output is formatted as follows:
  <code>Top Gun|408389</code>
  </p>
</div>

<div class="question">
  <h3>Q7 (q7_year_of_thieves):</h3>
  List the number of works that premiered in the same year that "Army of
  Thieves" premiered.
  <p><b>Details:</b>
  Print only the total number of works. The answer should include
  "Army of Thieves" itself. For this question, determine distinct works by
  their <code>title_id</code>, not their names.
  </p>
</div>

<div class="question">
  <h3>Q8 (q8_kidman_colleagues):</h3>
  List the all the different actors and actresses who have starred in a work
  with Nicole Kidman (born in 1967).
  <p><b>Details:</b>
  Print only the names of the actors and actresses in alphabetical
  order. The answer should include Nicole Kidman herself. Each name should
  only appear once in the output.
  <b>Note:</b> As mentioned in the schema, when considering the role of an
  individual on the crew, refer to the field <code>category</code>. The roles
  "actor" and "actress" are different and should be accounted for as such.
  </p>
</div>

<div class="question">
  <h3>Q9 (q9_9th_decile_ratings):</h3>
  For all people born in 1955, get their name and average rating on all
  movies they have been part of through their careers. Output the 9th decile of
  individuals as measured by their average career movie rating.
  <p><b>Details:</b>
  Calculate average ratings for each individual born in 1955 across
  only the <b>movies</b> they have been part of. Compute the quantiles for each
  individual's average rating using
  <a href="https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-ntile/">NTILE(10)</a>.<br/>
  Make sure your output is formatted as follows (round average rating to
  the nearest hundredth, results should be ordered by a compound value of 
  their ratings descending and secondly their name in alphabetical order):
  <code>Stanley Nelson|7.13</code>
  <b>Note:</b> You should take quantiles after processing the average career
  movie rating of individuals. In other words, find the individuals who have
  an average career movie rating in the 9th decile of all individuals.
  </p>
</div>

<div class="question">
  <h3>Q10 (q10_house_of_the_dragon):</h3>
  Concatenate all the unique titles for the <b>TV Series</b> "House of the
  Dragon" as a string of comma-separated values in alphabetical order of the
  titles.
  <p><b>Details:</b>
  Find all the unique dubbed titles for the new <b>TV show</b> "House of the
  Dragon" and order them alphabetically. Print a single string containing all
  these titles separated by commas. 
  <b>Hint:</b> You might find <a href="https://sqlite.org/lang_with.html">Recursive CTEs</a>
  useful.
  <b>Note:</b> Two titles are different even if they differ only in
  capitalization. Elements in the comma-separated value result should be
  separated with both a comma and a space, e.g. "foo, bar".
  </p>
</div>
