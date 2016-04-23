class RequestsController < ApplicationController

  def index
    @songs = Song.all.to_json
    # render json: @songs

    user_loc = #user location lat/long array - from params?
    @song_list = []

    @songs.each do |song|
      song_loc = [song.location.lat, song.location.long]
      if distance(user_loc, song_loc) < song.location.radius
        @song_list << song
      end
    end
    @song_list
  end

  def show

  end

  private

  def distance(point_one, point_two)
    Geocoder::Calculations.distance_between(point_one, point_two)
  end

end
