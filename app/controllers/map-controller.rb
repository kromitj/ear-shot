class MapsController < ApplicationController
  def drop_song
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts "inside ajx"
      render partial: '/artists/artist_drop_song'
  end
end
