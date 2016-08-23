class UsersController < ApplicationController

  # skip_before_action :redirect_visitors, only: [ :create, :new, :edit, :destroy, :update]
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate!, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
    if request.xhr?
      render '/users/_new', layout: false
    else
      render 'new'
    end
  end

  def show
    @songs = Song.all
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      if request.xhr?
        render :json => {:user_id => @user.id, :status => true}
      else
        redirect_to "/users/#{@user.id}"
      end
    else
      if request.xhr?
       render :json => {:error => "Invalid user credentials"}, :status => 422
      else
        @errors = @user.errors.full_messages
        render 'new'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    if request.xhr?
      render '_edit_user', layout: false, locals: {user: @user}
    else
      render 'edit'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render 'edit'
    end
  end



  def destroy
    @user.destroy
    session.delete(:user_id)
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :username, :email, :password, :password_confirmation,:profile_picture)
  end

end
