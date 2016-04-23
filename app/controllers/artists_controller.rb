class ArtistsController < ApplicationController
  skip_before_action :redirect_visitors, only: [:create, :new, :edit, :destroy, :update]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
    # render 'new'
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
    @artist = Artist.find(params[:id])

  end

  def destroy
    @artist.destroy
    redirect_to "/users/#{current_user.id}"
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :hometown, :bio, :profile_picture)
  end

end
