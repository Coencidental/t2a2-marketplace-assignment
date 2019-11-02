class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :ensure_location, except: [:new, :create], if: -> { current_user }


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def ensure_location

      if current_user.location == nil 
        redirect_to new_location_path
      end
  end

end
