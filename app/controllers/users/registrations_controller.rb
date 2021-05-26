class Users::RegistrationsController < Devise::RegistrationsController
    before_action :restrict_access, only: [:new, :create]

    private

    def restrict_access
        redirect_to root_path, notice: 'user registrations opens with invitations only...'
    end
end