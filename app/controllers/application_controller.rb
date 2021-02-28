class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||=User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        redirect_to login_path unless logged_in?
    end

    def redirect_if_logged_in
        redirect_to cigars_path if logged_in?
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end


end
