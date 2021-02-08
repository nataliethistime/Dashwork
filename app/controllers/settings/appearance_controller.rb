module Settings
  class AppearanceController < ApplicationController
    def index
    end

    def update
      user = curent_user
      user.update appearance_params
      redirect_to :index, notice: 'Your preferred theme has been saved'
    end

    private

    def appearance_params
      params.require(:user).permit(:preferred_theme)
    end

    def sidebar
      :settings
    end
  end
end
