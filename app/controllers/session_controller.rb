class SessionController < ApplicationController
  respond_to :json, :html
  # skip_before_action :redirect_visitors, only: [ :create, :new]
  def new
    @user = User.new
    if request.xhr?
      puts "in xhr for session new"
      render 'session/_new', layout: false
    else
      render 'new'
    end
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      log_in(@user)
      if request.xhr?
       render :json => {:user_id => @user.id}
      else
        redirect_to user_path(@user)
      end
    else
      if request.xhr?
        render :json => {:error => "Invalid username/password"}, :status => 422
      else
        flash[:notice] = 'Incorrect username/password input'
        redirect_to root_path
      end
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

private

  def user_params
    params.require(:session).permit(:username, :password)
  end


end
