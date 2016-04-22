class LandingsController < ApplicationController
  skip_before_action :redirect_visitors

  def index
    if logged_in?
      redirect_to current_user
    else
      render 'index'
    end
  end

end
