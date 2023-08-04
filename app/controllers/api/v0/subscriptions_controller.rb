class Api::V0::SubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # remove line above after development is complete
  # before_action :verify_session, only: %i[create update]

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { errors: subscription.errors }, status: 400
    end
  end

  def update
    @subscription = Subscription.find_by(customer_id: params[:subscription][:customer_id], tea_id: params[:subscription][:tea_id])
    @subscription.update(subscription_params)

    render json: SubscriptionSerializer.new(@subscription), status: 200
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status, :frequency, :customer_id, :tea_id)
  end
end
