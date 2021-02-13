class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] 
        #how do we know what @current_user is? @current_user == session[:user_id] // true
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:message] = "Please log in or sign up"
            redirect_to '/'
        end
    end

end
