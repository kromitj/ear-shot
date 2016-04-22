class UsersController < ApplicationController
  skip_before_action :redirect_visitors, only: [ :create, :new]

  def new
     @user = User.new
    if request.xhr?
      render 'users/_new', layout: false
    else
      render 'users/new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

end
