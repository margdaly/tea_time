class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def verify_session
    unless session[:customer_id] && current_customer
      render json:
        { message: 'Unauthorized to access this resource. Please log in.' }, status: :unauthorized
    end
  end
end
