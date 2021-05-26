class Users::InvitationsController < Devise::InvitationsController
    before_action :check_admin_access, only: [:new, :create, :destroy]
    private

    def check_admin_access
        unless current_user.super_admin?
            redirect_to root_path, notice: 'Only Super Admins can Invite Others'
        end
    end
end