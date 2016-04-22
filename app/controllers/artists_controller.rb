class ArtistsController < ApplicationController
  def new
    @song = Song.new
  end

  def create

  end


  def show
    @artist = Artist.find(params[:id])
  end


end
