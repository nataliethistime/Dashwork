module Settings
  class AppearanceController < ApplicationController
    def index
    end

    def update
      current_user.update appearance_params
      redirect_to settings_appearance_index_path, notice: 'Your preferred theme has been saved'
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
