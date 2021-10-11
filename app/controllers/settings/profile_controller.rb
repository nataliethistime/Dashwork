class Settings::ProfileController < ApplicationController
  def index
  end

  def update
    @user = current_user
    @user.update user_params
    redirect_to root_path, notice: 'Profile successfully updated.'
  end

  private

  def sidebar
    :settings
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :country, :time_zone)
  end
end
