class Api::SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create 
    payment_status = perform_payment
    
    if payment_status
      current_user.update_attribute(:subscriber, true)
      render json: { message: "Meow. Thanks for the yarn!", paid: true }
    else
      render json: { message: "Hiss Hiss! Your payment info are a miss!" }, status: 422
    end
  end

  private

  def perform_payment
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      description: "To access to articles. Meow!"
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 7500,
      currency: "USD"
    )
    charge.paid
  end
end
