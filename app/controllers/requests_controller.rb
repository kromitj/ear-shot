class RequestsController < ApplicationController

  def index
    @songs = Song.all
    @artists = Artist.all
    # respond_to |format|
    # render json: => {:songs => @songs,
    #                                :artists => @artists}

    render :json => @songs, :include => {:artist => {:only => [:name, :hometown, :bio]}}


  end

  def show

  end

end
