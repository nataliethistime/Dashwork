class Settings::ProfileController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update user_params
    flash[:notice] = 'Profile successfully updated.'
    render 'edit'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :country, :time_zone)
  end
end
