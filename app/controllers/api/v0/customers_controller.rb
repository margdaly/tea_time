class Api::V0::CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # remove line above after development is complete
  # before_action :verify_session, only: %i[show]

  def show
    # require 'pry'; binding.pry
    customer = Customer.find(email: params[:email])
    render json: CustomerSerializer.new(customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end
end
