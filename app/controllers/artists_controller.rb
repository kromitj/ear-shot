class ArtistsController < ApplicationController
  skip_before_action :redirect_visitors, only: [:create, :new, :edit, :destroy, :update]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.artists.new(artist_params)
    if @artist.save
      redirect_to "/artists/#{@artist.id}"
    else
      @errors = @artist.errors.full_messages
      render 'new'
    end
  end

  def show
    @songs = Song.all
    @artist = Artist.find(params[:id])
    artist_listens = song_listens(@artist.songs)
    if request.xhr?
      render :json => artist_listens, :only => [:listen_id, :long, :lat, :song_id]
    else
      render 'show'
    end
  end



  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to root_path
  end

private

  def artist_params
    params.require(:artist).permit(:name, :hometown, :bio, :profile_picture)
  end

  def song_listens(song_collection)
    listen_array = []
    song_collection.each do |song|
      listen_array << song.listens
    end
    listen_array
  end

end
