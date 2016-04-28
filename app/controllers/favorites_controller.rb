class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user])
    @favorites = Favorite.where(user_id: @user.id)
    render :json => @favorites, :include => [:artist, :song]
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user])
    @song = Song.find(params[:song])


    @favorite = Favorite.new(user_id: @user.id, song_id: @song.id)
    @favorite.save
    @favorites = Favorite.find_by(user_id: @user.id)
    render :json => @favorites
  end

end
