class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update]
    before_action :set_user, only: [:edit, :update]
    before_action :autherize_admin, only: [:edit, :update]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(*User::ROLES)
    end

    def autherize_admin
        unless current_user.super_admin?
            redirect_to users_path, notice: 'Not Allowed Action..'
        end
    end
end