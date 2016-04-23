class ArtistsController < ApplicationController
  def new
    render 'new'
  end

  def create

  end


  def show
    @artist = Artist.find(params[:id])
    @song = Song.new
  end


end
