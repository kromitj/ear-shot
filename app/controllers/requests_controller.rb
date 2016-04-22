class RequestsController < ApplicationController

  def index
    @songs = Song.all
    render json: @songs
  end

  def show

  end

end
