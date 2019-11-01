class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:sign_up]
end
