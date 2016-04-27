class RequestsController < ApplicationController
  # 10 miles = 16100 meters
  ACTIVE_RADIUS = 16100
  def index
    @songs = Song.all
    @artists = Artist.all

    return_array =[]

    @song_list = []
    @user_loc = [params[:lat], params[:long]]

    @songs.each do |song|
      array = []
      array.push(song.locations.first.lat)
      array.push(song.locations.first.long)
      if distance_between(@user_loc, array) < song.locations.first.radius
        return_array.push(song)
      else
        false
      end
    end

    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations
    print return_array


    # def active_songs
    active_songs_array = active_songs(@songs)
    nearby_songs_array = nearby_songs(active_songs_array, @user_loc)
    render :json => nearby_songs_array, :include {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}, :favorites, :listens}
git
  end

private

  def distance_between(point_one, point_two)
    Geocoder::Calculations.distance_between(point_one, point_two)*1000
  end

  def active_songs(song_collection)
    active_songs = []
    song_collection.each do |song|
      if song.locations.first.active?
        active_songs << song
      end
    end
    active_songs
  end

  def nearby_songs(song_collection, user_location)
    nearby_songs = []
    active_songs(song_collection).each do |song|
      loc = song.locations.first
      if distance_between([loc.lat,loc.long],[user_location]) < ACTIVE_RADIUS
      nearby_songs << song
      end
    end
    nearby_songs
  end



end
