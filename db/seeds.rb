# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
# User.create(f_name: "Mitch", l_name: "Kromit", username: "kromitj", email: "kromitj@hotmail.com", :password: "password", profile_picture: Faker::Avatar.image)
# User.create(f_name: "Chris", l_name: "Bunkers", username: "chrissyb", email: "chris@gmail.com", :password: "password", profile_picture: Faker::Avatar.image)

Artist.create(name: "Money Makin Mitch", user_id: 1, hometown: "Chi-Town", bio: "A lot has been said about mitch the moneymaker", profile_picture: Faker::Avatar.image)

# Artist.create(name: "yaboichrissyb", user_id: 2, hometown: "Chicago", bio: "West Philadelphia born and raised", profile_picture: Faker::Avatar.image)


52.times do
  Favorite.create(song_id: 1, user_id: 1)
end

357.times do
  Favorite.create(song_id: 2, user_id: 1)
end

671.times do
  Favorite.create(song_id: 3, user_id: 1)
end


248.times do
  Listen.create(user_id: 1, song_id: 1, long: rand(-87.6351..-87.635),lat: rand(41.88..41.89))
end

104.times do
  Listen.create(user_id: 1, song_id: 1, long: rand(-87.64..-87.63), lat: rand(41.89..41.93))
end

54.times do
  Listen.create(user_id: 1, song_id: 2, long: rand(-77.5..-77.47), lat: rand(18.25..18.3))
end

120.times do
  Listen.create(user_id: 1, song_id: 3, long: rand(-87.7..-87.69), lat: rand(41.908409..41.90892))
end





# Location.create(song_id: 10, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))

# Listen.create(user_id: 2, song_id: 1,  long: -87.371722, lat: 41.889234599999995)




