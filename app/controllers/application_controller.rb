class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  def check_user(resource)
    return if current_user.id == resource.user_id

    flash[:alert] = 'アクセス権限がありません。'
    redirect_to root_path
  end
end
