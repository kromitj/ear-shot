class RequestsController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
    return_array =[]

    @song_list = []
    @user_loc = [params[:lat], params[:long]]
    @test_loc =[40.7484, 73.9857]

    @songs.each do |song|
      array = []
      array.push(song.locations.first.lat)
      array.push(song.locations.first.long)
      if distance_between(@user_loc, array) < song.locations.first.radius
        return_array.push(song)
      else
        p false
      end
    end
    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations
    print return_array


    result = distance_between(@user_loc, @test_loc)
    puts result

  end

  def near
    @songs = Song.all
    @artists = Artist.all
    p @songs
    return_array =[]

    @song_list = []
    @user_loc = [params[:lat], params[:long]]
    @test_loc =[40.7484, 73.9857]

    @songs.each do |song|
      array = []
      array.push(song.locations.first.lat)
      array.push(song.locations.first.long)
      if distance_between(@user_loc, array) < song.locations.first.radius*1610
        return_array.push(song)
      end
    end
    print return_array
    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations



    result = distance_between(@user_loc, @test_loc)
    puts result


  end

  def show

  end

private

  def distance_between(point_one, point_two)
    Geocoder::Calculations.distance_between(point_one, point_two)*1000
  end


end
