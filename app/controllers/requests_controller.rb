class RequestsController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
    # respond_to |format|
    # render json: => {:songs => @songs,
    #                                :artists => @artists}


    render :json => @songs, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}}
    @song_list = []
    @user_loc = [params[:latitude], params[:longitude]]


    @test_loc =[40.7484, 73.9857]

    result = distance_between(@user_loc, @test_loc)
    puts result
    #@song_loc = @song.location

    #@song_loc = [@song.location.latitude, @song.location.longitude]

    #if #distance_between(@user_loc, @song_loc) < song radius
      #@song_list << song object
    #end
    #return song list

  end

  def show

  end

private

  def distance_between(point_one, point_two)
    Geocoder::Calculations.distance_between(point_one, point_two)
  end


end
