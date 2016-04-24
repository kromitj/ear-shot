class SessionController < ApplicationController
  respond_to :json, :html
  skip_before_action :redirect_visitors, only: [ :create, :new]
  def new
    @user = User.new
    if request.xhr?
      render 'session/_new', layout: false
    else
      respond_to do |format|
        format.html { render 'session/new' }
        format.json { render :json => @user}
      end
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    p @user
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      session[:user_id]
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Incorrect username/password input'
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end


end
