class SongsController < ApplicationController
  # require 'aws/s3'


  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    song_data = params[:song][:attachment]
    art_data = params[:song][:artwork]
    if song_data != nil && art_data != nil
      song_obj = S3_BUCKET.objects.create(song_data.original_filename, song_data.tempfile)
      art_obj = S3_BUCKET.objects.create(art_data.original_filename, art_data.tempfile)
      root = "http://ear-shot-mp3.s3.amazonaws.com/"
      song_url = root + song_data.original_filename
      art_url = root + art_data.original_filename
      @song = @artist.songs.new(name: params[:song][:name], attachment: song_url, artwork: art_url)
      @location = @song.locations.new(expiration: params[:song][:location][:expiration], lat: params[:song][:location][:lat], long: params[:song][:location][:long], radius: params[:song][:location][:radius] )
      if @song.save && @location.save
        redirect_to @artist
      else
        @errors = ["Make sure you've selected a location","Make sure you've entered a name","Make sure you're file is an mp3"]
        render "/artists/show"
      end
    else
      @errors = ["Something went wrong, try again!"]
      # render "/artists/show"
      redirect_to @artist
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

  def drop_song
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts "inside ajx"
      render'/artists/_artist_drop_song', layout: false
  end


  def available_songs
    longitude = params[:longitude]
    latitude = params[:latitude]
    # longitude = "1000000000000"
    # latitude = "1000000000000000"
    all_songs = Song.all
    puts "all songs: #{all_songs.count}"
    @songs = current_user.available_songs(longitude, latitude, all_songs)
    puts "available songs: #{@songs.count}"
    render partial: 'songs/all_songs', layout: false
  end

  def heat_map
    if request.xhr?
      @song = Song.find(params[:id])
      render :json => @song.listens, :only => [:long, :lat]
    end

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
