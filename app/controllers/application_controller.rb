class ApplicationController < ActionController::Base
  protect_from_forgery


  include SessionsHelper

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end



  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end
