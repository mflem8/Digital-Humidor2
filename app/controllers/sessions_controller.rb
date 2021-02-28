class SessionsController < ApplicationController

    def welcome

    end

    def new

    end

    def create
        if params[:provider]
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
        
            if @user.try(:authenticate, params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Invalid login credentials. Please try again."
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end