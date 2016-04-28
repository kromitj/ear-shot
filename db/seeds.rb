# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

52.times do
  Favorite.create(song_id: 19, user_id: 1)
end

357.times do
  Favorite.create(song_id: 18, user_id: 1)
end

671.times do
  Favorite.create(song_id: 17, user_id: 1)
end


248.times do
  Listen.create(user_id: 1, song_id: 17, long: rand(-87.6351..-87.635),lat: rand(41.88..41.89))
end

1014.times do
  Listen.create(user_id: 1, song_id: 17, long: rand(-87.64..-87.63), lat: rand(41.89..41.93))
end

504.times do
  Listen.create(user_id: 1, song_id: 19, long: rand(-77.5..-77.47), lat: rand(18.25..18.3))
end

1520.times do
  Listen.create(user_id: 1, song_id: 19, long: rand(-87.7..-87.69), lat: rand(41.908409..41.90892))
end





# Location.create(song_id: 10, radius: 1000, long: -87.6371722, lat: 41.889234599999995, expiration: Faker::Date.forward(7))

# Listen.create(user_id: 2, song_id: 1,  long: -87.371722, lat: 41.889234599999995)




