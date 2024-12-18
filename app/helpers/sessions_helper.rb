module SessionsHelper

    # Logs in the given user and sets a session token for security.
    def log_in(user)
      session[:user_id] = user.id
      session[:session_token] = user.session_token  # Guard against session replay attacks
    end
  
    # Remembers a user in a persistent session.
    def remember(user)
      user.remember
      cookies.permanent.encrypted[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end
  
    # Returns the user corresponding to the session or remember token cookie.
    def current_user
      if (user_id = session[:user_id])
        user = User.find_by(id: user_id)
        Rails.logger.debug "Current user from session: #{user.inspect}"
        @current_user ||= user if session[:session_token] == user.session_token
      elsif (user_id = cookies.encrypted[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(:remember, cookies[:remember_token])
          log_in user
          Rails.logger.debug "Current user from cookies: #{user.inspect}"
          @current_user = user
        end
      end
    end
  
      # Returns true if the given user is the current user.
  def current_user?(user)
    user && user == current_user
  end
  
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
      !current_user.nil?
    end
  
    # Forgets a user in a persistent session.
    def forget(user)
      user.update_attribute(:remember_digest, nil)
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end
  
    # Logs out the current user.
    def log_out
      forget(current_user)
      reset_session
      @current_user = nil
    end
  
  end