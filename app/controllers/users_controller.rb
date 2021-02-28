class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_logged_in, except: [:new, :create]
    before_action :redirect_if_logged_in, only: [:new, :create] 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
