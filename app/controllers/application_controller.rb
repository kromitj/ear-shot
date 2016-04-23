class ApplicationController < ActionController::Base
  # before_action :redirect_visitors
  include UsersHelper
  # skip_before_action :verify_authenticity_token
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
end
