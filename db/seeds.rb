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

Artist.create(name: "Umphrey's McGee", user_id: 1, hometown: "Chicago", bio: "Too much rock for one hand.", profile_picture: "http://www.fillmoreauditorium.org/wp-content/uploads/2015/12/AFnewyearsrun_751.jpg")

Artist.create(name: "LCD Soundsystem", user_id: 2, hometown: "New York City", bio: "LCD Soundsystem is an American rock band from Brooklyn, New York, formed in 2002. It is fronted by musician James Murphy, co-founder of record label DFA Records.", profile_picture: "http://static.stereogum.com/uploads/2013/05/lcdsoundsystem.jpg")

Artist.create(name: "Dave Matthews Band", user_id: 1, hometown: "Charlottesville", bio: "American rock band that was formed in Charlottesville, Virginia in 1991", profile_picture: "https://media.livenation.com/bos/37/d2/97/be14642624faf06585d38db261597dc1a5.jpg")

Artist.create(name: "Daft Punk", user_id: 2, hometown: "Paris", bio: "Daft Punk are an electronic music duo consisting of French musicians Guy-Manuel de Homem-Christo and Thomas Bangalter.", profile_picture: "https://a4-images.myspacecdn.com/images03/2/85a286a4bbe84b56a6d57b1e5bd03ef4/300x300.jpg")

Artist.create(name: "Kanye", user_id: 1, hometown: "Chicago", bio: "Kanye West is an American hip hop recording artist, songwriter, record producer, fashion designer, and entrepreneur.", profile_picture: "http://assets.nydailynews.com/polopoly_fs/1.2533434.1455644371!/img/httpImage/image.jpg_gen/derivatives/article_635/people-kanye-west.jpg")

Artist.create(name: "Phish", user_id: 2, hometown: "Burlington", bio: "Phish is an American rock and roll band noted for their musical improvisation, extended jams, blending of musical genres, and dedicated fan base.", profile_picture: "http://sensiblereason.com/wp-content/uploads/2014/07/phish.jpg")

5.times do
  Song.create(name: Faker::Hipster.word, attachment: "http://creaumond.ourea.feralhosting.com/Run%20The%20Jewels%20-%20Banana%20Clipper.mp3", artist_id: 1, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

4.times do
  Song.create(name: Faker::Hacker.noun, attachment: "http://creaumond.ourea.feralhosting.com/Run%20The%20Jewels%20-%20Banana%20Clipper.mp3", artist_id: 2, artwork: Faker::Placeholdit.image("50x50", 'jpg'))
end

Song.create(name:"Doin' It Right", attachment: "http://ear-shot-mp3.s3.amazonaws.com/LCD Soundsystem - Daft Punk Is Playing at My House.mp3", artist_id: 6, artwork:"http://ear-shot-mp3.s3.amazonaws.com/dp.jpg" )

Song.create(name:"Father Stretch my hands", attachment: "http://ear-shot-mp3.s3.amazonaws.com/02.%20Father%20Stretch%20My%20Hands%20Pt.%201.mp3", artist_id: 7, artwork:"http://ear-shot-mp3.s3.amazonaws.com/people-kanye-west.jpg" )

Song.create(name:"What Would You Say", attachment: "http://ear-shot-mp3.s3.amazonaws.com/Dave Matthews Band - What Would You Say.mp3", artist_id: 5, artwork:"http://ear-shot-mp3.s3.amazonaws.com/dmb.jpg" )

Song.create(name:"Fuego", attachment: "http://ear-shot-mp3.s3.amazonaws.com/Phish - Fuego.mp3", artist_id: 8, artwork:"http://ear-shot-mp3.s3.amazonaws.com/phish.jpg" )

Song.create(name:"Miss Tinkle's Overture", attachment: "http://ear-shot-mp3.s3.amazonaws.com/Umphrey's McGee - Miss Tinkle's Overture.mp3", artist_id: 3, artwork:"http://ear-shot-mp3.s3.amazonaws.com/umph.jpg" )

Song.create(name:"Daft Punk Is Playing in my House", attachment: "http://ear-shot-mp3.s3.amazonaws.com/LCD Soundsystem - Daft Punk Is Playing at My House.mp3", artist_id: 3, artwork:"http://ear-shot-mp3.s3.amazonaws.com/lcd.jpg" )


Location.create(song_id: 10, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 11, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 12, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 13, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 14, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 15, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))

Location.create(song_id: 1, radius: 500, long: -87.6371722, lat:  41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 2, radius: 500, long: -87.6371722, lat:  41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 3, radius: 200, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 4, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))

Location.create(song_id: 5, radius: 800, long: -87.6371722, lat: 42.0889234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 6, radius: 200,  long: -87.6371722, lat: 41.9234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 7, radius: 1000,  long: -88.6371722, lat: 41.89234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 8, radius: 800,  long: -87.4371722, lat: 42.234599999995, expiration: Faker::Date.forward(7))
Location.create(song_id: 9, radius: 200,  long: -87.2371722, lat: 41.9234599999995, expiration: Faker::Date.forward(7))
# Location.create(song_id: 10, radius: 400,  long: -87.671722, lat: 41.889234599999995)
# Location.create(song_id: 11, radius: 1000,  long: -87.6374870, lat: 41.8896940)





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
