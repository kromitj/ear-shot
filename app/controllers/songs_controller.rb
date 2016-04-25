class SongsController < ApplicationController
  # require 'aws/s3'
  skip_before_action :redirect_visitors

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(name: params[:song][:name], attachment: params[:song][:attachment], artwork: params[:song][:artwork])
    p params[:song][:location]
    @location = @song.locations.new(expiration: params[:song][:location][:expiration], lat: params[:song][:location][:lat], long: params[:song][:location][:long], radius: params[:song][:location][:radius] )
    # @location = @song.locations.new(params)
    if @song.save && @location.save
      redirect_to @artist
    else
      @errors = ["Make sure you've selected a location","Make sure you've entered a name","Make sure you're file is an mp3"]
      render "/artists/show"
    end
  end
# "location"=>{"expiration"=>"2016-04-30T00:00", "long"=>"-87.635238468647", "lat"=>"41.894994021302146", "radius"=>"1000"}},

  # def create
  #   @file_data = params[:song][:file]
  #   @artist = Artist.find(params[:artist_id])
  #   obj = S3_BUCKET.objects.create(params[:song][:name], @file_data.tempfile)
  #   @song = @artist.songs.new(url: obj.public_url, name: params[:song][:name])
  #   if @song.save
  #     redirect_to @artist
  #   else
  #     @errors = @song.errors.full_messages
  #     redirect_to @artist
  #   end
  # end

  def show
    @song = Song.find(params[:id])
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
