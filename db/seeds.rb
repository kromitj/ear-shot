# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create(f_name: "Mitch", l_name: "Kroska", username: "kromitj", email: "krosksam8457@hotmail.com", password: "password", profile_picture: Faker::Avatar.image("my-own-slug"))

User.create(f_name: "Yaboi", l_name: "ChrissyB", username: "yaboichrissyb", email: "yaboichrissyb@gmail.com", password: "password", profile_picture: Faker::Avatar.image("my-own-slug"))

Artist.create(name: "$$money makin mitch$$", user_id: 1, hometown: "Minneapolis", bio: "A lot can be said about mitch the money maker.  We'll leave it to you to do it.", profile_picture: Faker::Avatar.image("my-own-slug"))

Artist.create(name: "The boy yaboi", user_id: 2, hometown: "Chicago", bio: "In west philadelphia born and raised", profile_picture: Faker::Avatar.image("my-own-slug"))

5.times do
  Song.create(name: Faker::Hipster.word, attachment: "http://creaumond.ourea.feralhosting.com/Run%20The%20Jewels%20-%20Banana%20Clipper.mp3", artist_id: 1, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

5.times do
  Song.create(name: Faker::Hacker.noun, attachment: "http://creaumond.ourea.feralhosting.com/Run%20The%20Jewels%20-%20Banana%20Clipper.mp3", artist_id: 2, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

Song.create(name:"Father Stretch my hands", attachment: "https://s3.amazonaws.com/ear-shot-mp3/The+boy+yaboi%3A+Father", artist_id: 2, artwork: "https://s3.amazonaws.com/ear-shot-mp3/The+boy+yaboi%3A+KANYE+BABY+ARTWORK")

Location.create(song_id: 1, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 2, radius: 500, long: -87.6371722, lat:  41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 3, radius: 200, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 4, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))

Location.create(song_id: 5, radius: 800, long: -87.6371722, lat: 42.0889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 6, radius: 200,  long: -87.6371722, lat: 41.9234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 7, radius: 1000,  long: -88.6371722, lat: 41.89234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 8, radius: 800,  long: -87.4371722, lat: 42.234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 9, radius: 200,  long: -87.2371722, lat: 41.9234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 10, radius: 400,  long: -87.671722, lat: 41.889234599999995)


20.times do
  Listen.create(user_id: 2, song_id: (1..5).to_a.sample,  long: -87.371722, lat: 41.889234599999995)
end

20.times do
  Listen.create(user_id: 1, song_id: (6..10).to_a.sample,  long: -87.71722, lat: 41.4599999995)

end

5. times do
  Favorite.create(song_id: (1..5).to_a.sample, user_id: 2)
end

5.times do
  Favorite.create(song_id: (6..10).to_a.sample, user_id: 1)
end

3.times do
  Comment.create(song_id: (1..5).to_a.sample, user_id: 2, content: Faker::Hipster.sentence)
end

3.times do
  Comment.create(song_id: (6..10).to_a.sample, user_id: 1, content: Faker::Hipster.sentence)
end
