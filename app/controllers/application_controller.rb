class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #cancan rescue from errors
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to notebooks_path, :alert => exception.message
    else
      redirect_to root_url, :alert => exception.message
    end
  end

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
   notebooks_path
  end

  def user_notebooks
    @notebooks = current_user.notebooks.all
  end
end
