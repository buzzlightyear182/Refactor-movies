require '../lib/top_movies'

describe 'Movie' do

	before :each do
		@movie = Movie.new 1, 120, 1985, 10
	end

  it 'should have an ID' do
    expect(@movie.id).to eq(1)
  end

  it 'should have a length' do
    expect(@movie.length).to eq(120)
  end

  it 'should have a year' do
    expect(@movie.year).to eq(1985)
  end

  it 'should have a popularity' do
    expect(@movie.popularity).to eq(10)
  end

  it 'may have a title' do
  	@movie.title = "Jane"
    expect(@movie.title).to eq("Jane")
  end

  it 'may not have a title' do
    expect(@movie.title).to eq(nil)
  end

end

#Given, When, Then!

describe 'Movie List' do

	it 'should have a movie object' do
		# given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 120, 1985, 10
		movie.title = "Jane"
		@list.add_movie movie

		#Then
		expect(@list.movies.length).to eq(1)
		expect(@list.movies).to eq([movie])
	end

	it 'should have two movie objects' do
		# Given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 120, 1985, 10
		movie.title = "Jane"
		@list.add_movie movie

		second = Movie.new 2, 60, 1988, 9
		second.title = "Jessica"
		@list.add_movie second

		#Then
		expect(@list.movies.length).to eq(2)
		expect(@list.movies).to eq([movie, second])
	end

	it 'should filter the movie list' do
		# Given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 125, 1985, 10
		movie.title = "Jane"
		@list.add_movie movie

		second = Movie.new 2, 100, 1988, 9
		second.title = "Jessica"
		@list.add_movie second

		result = @list.filter 120, 12

		#Then
		expect(result).to eq([movie])
	end

	it 'should sort by popularity' do
		# Given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 125, 1985, 10
		movie.title = "Jane"
		@list.add_movie movie

		second = Movie.new 2, 124, 1988, 5
		second.title = "Jessica"
		@list.add_movie second

		# @list = @list.filter(120, 12)

		result = @list.sort_by_popularity

		#Then
		expect(result).to eq([second, movie])
	end

	it 'should group by year' do
		# Given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 125, 1985, 10
		movie.title = "Jane"
		@list.add_movie movie

		second = Movie.new 2, 124, 1988, 5
		second.title = "Jessica"
		@list.add_movie second

		third = Movie.new 1, 125, 1985, 10
		third.title = "Janette"
		@list.add_movie third

		fourth = Movie.new 2, 124, 1988, 5
		fourth.title = "Jacey"
		@list.add_movie fourth

		result = @list.group_by_year

		#Then
		expect(result).to eq({1985=>[movie, third], 1988=>[second, fourth]})
	end

it 'should sort grouped list by year' do
		# Given
		@list = MovieList.new

		#When
		movie = Movie.new 1, 125, 2014, 10
		movie.title = "Jane"
		@list.add_movie movie

		second = Movie.new 2, 124, 1988, 5
		second.title = "Jessica"
		@list.add_movie second

		third = Movie.new 1, 125, 2014, 10
		third.title = "Janette"
		@list.add_movie third

		fourth = Movie.new 2, 124, 1988, 5
		fourth.title = "Jacey"
		@list.add_movie fourth

		result = @list.sort_by_year

		#Then
		expect(result).to eq({1988=>[second, fourth], 2014=>[movie, third]})
	end

end