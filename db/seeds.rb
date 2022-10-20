# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all


url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end
puts "Movies created"

10.times do
  List.create(
    name: Faker::Book.genre
  )
end

@lists = List.all
@lists_ids = []
@lists.each do |list|
  @lists_ids << list.id
end
puts @lists_ids
@movies = Movie.all
@movies_ids = []
@movies.each do |movie|
  @movies_ids << movie.id
end
puts @movies_ids

20.times do
  Bookmark.create(
    comment: "#{Faker::Emotion.adjective} #{Faker::Beer.name}",
    list_id: @lists_ids.sample,
    movie_id: @movies_ids.sample
  )
end

10.times do
  Review.create(
    content: Faker::Quote.matz,
    rating: rand(0..5),
    list_id: @lists_ids.sample
  )
end
puts "Finished!"
