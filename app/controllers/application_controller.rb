class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def about
    # Static about page
    render "shared/about"
  end

  def contact
    render "shared/contact" # Render the contact form
  end
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || books_path)
  end
end
