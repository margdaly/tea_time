class Api::V0::SubscriptionsController < ApplicationController
  before_action :check_subscription, only: %i[create update]

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { errors: subscription.errors }, status: 400
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status, :frequency, :customer_id, :tea_id)
  end

  def check_subscription
    @subscription = Subscription.find_by(customer_id: params[:subscription][:customer_id], tea_id: params[:subscription][:tea_id])
  end
end
