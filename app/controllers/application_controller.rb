class ApplicationController < ActionController::Base
    #before_action :authenticate_user!

    protected

    def authenticate_inviter!
      unless current_user.super_admin?
        redirect_to root_path, notice: 'Not Allowed Action'
      end  
    end
end
