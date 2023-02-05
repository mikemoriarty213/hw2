# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all
Rails.logger.info

# Generate models and tables, according to the domain model.

# Step 1. Run the below in terminal:
# rails generate model Movie
# rails generate model Studio
# rails generate model Actor
# rails generate model Role

# Step 2. In each model's db/migrate file, add the below columns:
# Movies
# t.string "title"
# t.string "year_released"
# t.string "rating"
# t.integer "studio_id"

# Studios
# t.string "name"

# Actors
# t.string "name"

# Roles
# t.integer "movie_id"
# t.integer "actor_id"
# t.string "character_name"


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

# Check Studios table
# all_studios = Studio.all
# puts all_studios.inspect

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

# Check Actors table
# all_actors = Actor.all
# puts all_actors.inspect

warner_bros = Studio.find_by({ "name" => "Warner Bros." })

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = "2005"
movie["rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = "2008"
movie["rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = "2012"
movie["rating"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

# Check Movies table
# all_movies = Movie.all
# puts all_movies.inspect

batman_begins = Movie.find_by({ "title" => "Batman Begins" })
the_dark_knight = Movie.find_by({ "title" => "The Dark Knight" })
the_dark_knight_rises = Movie.find_by({ "title" => "The Dark Knight Rises" })

christian_bale = Actor.find_by({ "name" => "Christian Bale" })
michael_caine = Actor.find_by({ "name" => "Michael Caine" })
aaron_eckhart = Actor.find_by({ "name" => "Aaron Eckhart" })
joseph_gordonlevitt = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })
maggie_gyllenhaal = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
tom_hardy = Actor.find_by({ "name" => "Tom Hardy" })
anne_hathaway = Actor.find_by({ "name" => "Anne Hathaway" })
katie_holmes = Actor.find_by({ "name" => "Katie Holmes" })
heath_ledger = Actor.find_by({ "name" => "Heath Ledger" })
liam_neeson = Actor.find_by({ "name" => "Liam Neeson" })
gary_oldman = Actor.find_by({ "name" => "Gary Oldman" })

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liam_neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katie_holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

# Check Roles table
all_roles = Role.all
puts all_roles.inspect

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
