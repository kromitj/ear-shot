class SongsController < ApplicationController
  # require 'aws/s3'
  skip_before_action :redirect_visitors

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    p "$$$$$$$$$$$$$$$$$$$$$"
    p params
    p "$$$$$$$$$$$$$$$$$$$$$"
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(name: params[:song][:name], attachment: params[:song][:attachment], artwork: params[:song][:artwork])
    song_data = params[:song][:attachment]
    art_data = params[:song][:artwork]
    song_obj = S3_BUCKET.objects.create("#{@artist.name}: #{params[:song][:name]}", song_data.tempfile)
    art_obj = S3_BUCKET.objects.create("#{@artist.name}: #{params[:song][:name]}(Artwork)", art_data.tempfile)
    @location = @song.locations.new(expiration: params[:song][:location][:expiration], lat: params[:song][:location][:lat], long: params[:song][:location][:long], radius: params[:song][:location][:radius] )
    if @song.save && @location.save
      redirect_to @artist
    else
      @errors = ["Make sure you've selected a location","Make sure you've entered a name","Make sure you're file is an mp3"]
      render "/artists/show"
    end
  end


  def show
    @song = Song.find(params[:id])
    if request.xhr?
      render '_show', layout: false, locals: {song: @song}
    else
      render 'show'
    end
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to @song.artist
  end

  private
    def song_params
      params.require(:song).permit(:name, :artist_id, :attachment, :artwork, :location => [:expiration, :lat, :long, :radius])
    end

end
