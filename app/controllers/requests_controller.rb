class RequestsController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
    # respond_to |format|
    # render json: => {:songs => @songs,
    #                                :artists => @artists}
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
        p false
      end
    end
    render :json => return_array, :include => {:artist => {:only => [:name, :hometown, :bio, :profile_picture]}, :comments => {:only => [:content]}}, :include => :locations
    # print return_array

  end

  def show

  end

private

  def distance_between(point_one, point_two)
    Geocoder::Calculations.distance_between(point_one, point_two)*1000
  end


end
