class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    end

    def authenticate_admin!
      unless current_user.is_admin
        flash[:alert] = "You must be an admin to do that"
        redirect_to root_path
      end
    end
end
