class Api::V0::SessionsController < ApplicationController
  
  # before_action :verify_session, only: %i[destroy]

  def create
    @customer = Customer.find_by(email: params[:customer][:email])

    if @customer&.authenticate(params[:customer][:password])
      session[:customer_id] = @customer.id
      render json: { message: 'Customer Logged In.' }, status: :ok
    else
      render json: { message: 'Invalid Credentials.' }, status: :unauthorized
    end
  end

  def destroy
    session[:customer_id] = nil
  end

  private

  def sessions_params
    params.require(:customer).permit(:email, :password)
  end
end
