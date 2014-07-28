require 'rubygems'
require 'json'
require 'pry'

class Movie
  attr_accessor :id, :length, :year, :popularity, :title

  def initialize id, length, year, popularity
    self.id = id
    self.length = length
    self.year = year
    self.popularity = popularity
  end

  def self.title
    @title = title
  end

end

class MovieList
  attr_accessor :movies

  def initialize
    @movies = []
    @grouped = {}
  end

  def add_movie movie
    @movies << movie
    @movies
  end

  # filter the movies that does not meet the passed requirements
  def filter film_time, delta
    @movies = @movies.select {|movie| (movie.length - film_time).abs < delta}
  end

  def sort_by_popularity
    @movies.sort {|first, second| first.popularity <=> second.popularity}
  end

  def sort_by_year
    @grouped = @movies.group_by_year
    @grouped.each do |year, movies|
      puts movies
    end
  end

  # def group_by_year
  #   @movies.each do |movie|
  #     @grouped[movie.year] ||= []
  #     @grouped[movie.year] << movie
  #   end
  #   @grouped
  # end

  # grouped_movies.each do |year, movies|
  #       movies.each_index do |i|
  #         (movies.length - i - 1).times do |job|
  #           if movies[job]['popularity'] > movies[job + 1]['popularity']
  #             movies[job], movies[job + 1] = movies[job + 1], movies[job]
  #           end
  #         end
  #       end
  #     end
  #   end

end
# class TopMovies

  # def self.generate_top_lists(movies, filter_by_time = false, group_by_year = false)
  # def self.generate_top_lists(movies, filter_by_time = false, film_time = 120, delta = 12, group_by_year = false)
    # grouped_movies = {}

  # def sort_by_popularity
  #   if filter_by_time
  #     @movies = @movies.filter
  #   end
  #   @movies.sort_by {|movie| movie.popularity}
  # end

  #   # filter the movies that does not meet the passed requirements
  #   # movies.each { |movie| if ((movie['length'] - film_time).abs < delta) then filtered_movies << movie end }

  #   # order the movies by popularity
  #   filtered_movies.each_index do |i|
  #     (filtered_movies.length - i - 1).times do |job|
  #       if filtered_movies[job]['popularity'] > filtered_movies[job + 1]['popularity']
  #         filtered_movies[job], filtered_movies[job + 1] = filtered_movies[job + 1], filtered_movies[job]
  #       end
  #     end
  #   end


  #   if group_by_year
  #     # filter the movies that does not meet the passed requirements
  #     # filtered_movies_for_groups = []
  #     # movies.each { |movie| if ((movie['length'] - film_time).abs < delta) then filtered_movies_for_groups << movie end }

  #     # we group the movies by year
  #     filtered_movies_for_groups.each do |movie|
  #       grouped_movies[movie['year']] ||= []
  #       grouped_movies[movie['year']] << movie
  #     end

  #     # we order each group
  #     grouped_movies.each do |year, movies|
  #       movies.each_index do |i|
  #         (movies.length - i - 1).times do |job|
  #           if movies[job]['popularity'] > movies[job + 1]['popularity']
  #             movies[job], movies[job + 1] = movies[job + 1], movies[job]
  #           end
  #         end
  #       end
  #     end
  #   end

  #   [filtered_movies, grouped_movies]
  # end
# end
