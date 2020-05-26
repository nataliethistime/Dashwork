class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def home
  end
end
