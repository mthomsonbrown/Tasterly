include ActionController::HttpAuthentication::Basic::ControllerMethods
include ActionController::HttpAuthentication::Token::ControllerMethods

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :if => :format_html?
  before_filter :authenticate_user_from_token, :unless => :format_html?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def format_html?
    request.format.html?
  end
  
  def authenticate_user_from_token
    unless authenticate_with_http_token do |token, options| 
      @current_user = User.find_by(auth_token: token) 
    end
      render json: { error: 'Bad Token'}, status: 401
    end
  end
  
  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:is_admin?)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  end
end
