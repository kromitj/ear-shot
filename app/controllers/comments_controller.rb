class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render :json => @comments, :include => {:song => {:only => [:name, :artwork]}, :user => {:only => [:profile_picture]}}
  end
  def new
    @comment = Comment.new
  end

  def create
    # p params
    @user = User.find(params[:user])
    @song = Song.find(params[:song])
    render :json => @song

    @comment = Comment.new(content: params[:content], user_id: @user.id, song_id: @song.id)
    @comment.save
  end

end
