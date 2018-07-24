class ChargesController < ApplicationController
  before_action :set_bid, only: [:new]

  def new
  end

  def create
    # Amount in cents
    @amount = @bid.offer.to_i * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.offer,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    ModelMailer.transaction_message(current_user).deliver

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def set_bid
    @bid = Bid.find(params[:bid_id])
  end

  def bid_params
    params.require(:bid).permit(:task_id, :name, :comment, :offer)
  end

end
