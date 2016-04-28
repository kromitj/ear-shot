module ApplicationHelper

  def distance_between(lat1, lon1, lat2, lon2)
  earth_radius = 6378.137
  dLat = ()
  end



  def measure(lat1, lon1, lat2, lon2)
      radius = 6378.137 # Radius of earth in KM
      dLat = (lat2 - lat1) * Math::PI / 180;
      dLon = (lon2 - lon1) * Math::PI / 180;
      a = Math::sin(dLat/2) * Math::sin(dLat/2) +
      Math::cos(lat1 * Math::PI / 180) * Math::cos(lat2 * Math::PI / 180) *
      Math::sin(dLon/2) * Math::sin(dLon/2);
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a));
      d = radius * c;
      return d * 1000; # meters

  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authenticate!
    redirect_to session_new_path unless logged_in?
  end
end
