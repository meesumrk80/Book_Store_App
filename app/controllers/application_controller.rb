class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Pundit authorization handling
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Devise: permit extra parameters (username)
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Static pages
  def about
    render "shared/about"
  end

  def contact
    render "shared/contact"
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || books_path)
  end

  protected

  def configure_permitted_parameters
    # Allow :username during sign up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])
  end
end
