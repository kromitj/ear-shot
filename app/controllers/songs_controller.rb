class SongsController < ApplicationController
  # require 'aws/s3'
  skip_before_action :redirect_visitors

  def new
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    p "$$$$$$$$$$$$$$$$$$$$$$$"
    p params
    p "$$$$$$$$$$$$$$$$$$$$$$$$$$$"

    # @location = @song.locations.new(params)
    if @song.save
      redirect_to @artist
    end
  end

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

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
  end

  private
    def song_params
      params.require(:song).permit(:name, :artist_id, :attachment)
    end

end
