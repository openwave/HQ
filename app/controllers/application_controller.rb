class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  helper :all # include all helpers, all the time
  protect_from_forgery :except=>[:new_image,:create_deal,:update_deal_image]# See ActionController::RequestForgeryProtection for details
before_filter :set_flag,:clear_cache
  private
  
  def clear_cache
    response.headers["Pragma"] = "no-cache"
    response.headers["Cache-Control"] = "no-cache"
  end



def set_flag
 $map = 0
 $flag=0
 $search=1
 $review =0
 $business = 0
end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      store_location
      #flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      #flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
