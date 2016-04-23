class SongsController < ApplicationController
  require 'aws/s3'
  skip_before_action :redirect_visitors

  def new
  end

  def create
puts "--------------------- ---- ----- ---->>>>>>>>>>"
    puts params
    @file_data = params[:song][:file]
    @artist = Artist.find(params[:artist_id])
    puts S3_BUCKET
    obj = S3_BUCKET.objects.create(params[:song][:name], @file_data.tempfile)
    puts "S3 object -------------------------------------->>>>>>>>>>>>>>>>>>>"
    puts obj
    # obj.write(
    #   file: params[:file],
    #   acl: :public_read
    #   )
    @song = @artist.songs.new(url: obj.public_url, name: params[:song][:name])
    if @song.save
      puts @song
      redirect_to @artist
    else
      puts "New song not saved  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      @errors = @song.errors.full_messages
      redirect_to @artist
    end
    # @song = @artist.songs.new(song_params)
    # puts "New song <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    # puts @song.file
    # if @song.save
    #   puts "New song saved <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    #   redirect_to @artist
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
  end

  private
    def song_params
      params.require(:song).permit(:name, :artist_id, :url)
    end

end
