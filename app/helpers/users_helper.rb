module UsersHelper
  def redirect_visitors
    if visitor?
      redirect_to '/'
    end
  end

  def visitor?
    session[:user_id] == nil
  end

   def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    puts "logged in? #{session[:user_id] != nil}"
    session[:user_id] != nil
  end

  def current_user
    if logged_in?
      @current_user = User.find(session[:user_id])
    end
  end

  def log_out
    session.delete(:user_id)
    current_user = nil
  end




end
