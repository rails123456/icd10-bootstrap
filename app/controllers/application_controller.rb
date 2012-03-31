class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def admin?
      current_user
      if current_user && current_user.role == 'admin'
       true
      else
       false
      end
    end

    def consultant?
      if current_user
       true if current_user.role == 'consultant'
      else
       false
      end
    end

    def member?
      if current_user
       true if current_user.role == 'member'
      else
       false
      end
    end

  helper_method :current_user, :admin?, :consultant?, :member?
end
