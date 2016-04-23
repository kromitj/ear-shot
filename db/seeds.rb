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

Artist.create(name: "$$money makin mitch$$", user_id: 1, hometown: "Minneapolis", bio: "A lot can be said about mitch the money maker.  We'll it to you to do it.", profile_picture: Faker::Avatar.image("my-own-slug"))

Artist.create(name: "The boy yaboi", user_id: 2, hometown: "Chicago", bio: "In west philadelphia born and raised", profile_picture: Faker::Avatar.image("my-own-slug"))

5.times do
  Song.create(name: Faker::Hipster.word, url: "http://www.w3schools.com/html/horse.mp3", artist_id: 1, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

5.times do
  Song.create(name: Faker::Hacker.noun, url: "http://www.w3schools.com/html/horse.mp3", artist_id: 2, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

Location.create(song_id: 1, radius: 1000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 2, radius: 2000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 3, radius: 3000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 4, radius: 1000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 5, radius: 2000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 6, radius: 3000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 7, radius: 1000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 8, radius: 2000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 9, radius: 3000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))
Location.create(song_id: 10, radius: 5000, long: Faker::Address.longitude, lat: Faker::Address.latitude, expiration: Faker::Date.forward(7))


20.times do
  Listen.create(user_id: 2, song_id: (1..5).to_a.sample, long: Faker::Address.longitude, lat: Faker::Address.latitude)
end

20.times do
  Listen.create(user_id: 1, song_id: (6..10).to_a.sample, long: Faker::Address.longitude, lat: Faker::Address.latitude)
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




