class LandingsController < ApplicationController


  def index
    if logged_in?
      redirect_to current_user
    else
      render 'index'
    end
  end

end
