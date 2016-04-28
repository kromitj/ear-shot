class ListensController < ApplicationController
  def create
    @user = User.find(params[:user])
    @song = Song.find(params[:song])
    @listen = Listen.new(user_id: @user.id, song_id: @song.id, lat: params[:lat], long: params[:long])
    @listen.save
    render json: @listen
  end
end
