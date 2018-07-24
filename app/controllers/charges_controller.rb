class ChargesController < ApplicationController
  before_action :set_bid, only: [:new]

  def new
  end

  def create
    # Amount in cents
    @amount = params[:offer].to_i * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    ModelMailer.transaction_message(current_user).deliver

    redirect_to root_path
    flash[:success] = "Successful payment"

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
