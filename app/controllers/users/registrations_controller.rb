module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      redirect_to new_user_session_path
    end

    def create
      redirect_to new_user_session_path
    end
  end
end
