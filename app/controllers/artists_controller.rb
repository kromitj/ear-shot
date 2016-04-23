class ArtistsController < ApplicationController
  def new
    render 'new'
  end

  def create

  end


  def show
    @artist = Artist.find(params[:id])
  end

  def show

  end


end
