class UsersController < ApplicationController

  # skip_before_action :redirect_visitors, only: [ :create, :new, :edit, :destroy, :update]
  skip_before_action :verify_authenticity_token
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    if request.xhr?
      render '_new', layout: false
    else
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.new
  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:f_name, :l_name, :username, :email, :password, :password_confirmation)
  end

end
