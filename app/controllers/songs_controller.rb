class SongController < ApplicationController
skip_before_action :redirect_visitors

  def new #new_user_artist_song GET    /users/:user_id/artists/:artist_id/songs/new(.:format) songs#new
  end

  def create #user_artist_songs POST   /users/:user_id/artists/:artist_id/songs(.:format)     songs#create
    @artist = Artist.find(:artist_id)
    @song = @artist.songs.new(params[:song])
    if @song.save
      flash
      redirect_to @artist
    else
      @errors = @song.errors.full_messages
      render 'new'
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
  end

end
