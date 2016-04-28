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
      if distance_between(@user_loc, array) < song.locations.first.radius && song.locations.first.expiration >= Time.now
        return_array.push(song)
      else
        false
      end
    end

    render :json => return_array, :include => { :comments => {:only => [:content]}}, :include => :locations, :include => :artist

  end

  def near
    @songs = Song.all
    @artists = Artist.all

    return_array =[]

    @song_list = []
    @user_loc = [params[:lat], params[:long]]

    @songs.each do |song|
      array = []
      array.push(song.locations.first.lat)
      array.push(song.locations.first.long)
      if distance_between(@user_loc, array) < song.locations.first.radius*1600 && song.locations.first.expiration >= Time.now
        return_array.push(song)
      else
        false
      end
    end

    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations

  end

  def near_songs
    p"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
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

    print return_array
    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations



    # result = distance_between(@user_loc, @test_loc)
    # puts result


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
