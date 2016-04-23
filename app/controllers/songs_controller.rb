class SongController < ApplicationController
skip_before_action :redirect_visitors

  def new
    @song = Song.new
  end

  def create
    @artist = Artist.find(:artist_id)
    @song = @artist.songs.new(params[:song])
    if @song.save
      flash
      redirect_to @artist
    else
      @errors = @song.errors.full_messages
      render 'new'
    end
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
  end

end
