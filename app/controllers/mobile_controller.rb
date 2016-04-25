class MobileController < ApplicationController
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

    if @user && @user.authenticate(params[:password])
      render :json => @user
    else
      'Incorrect username/password input'
    end
  end
end
