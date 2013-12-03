class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 200

    if params[:stripeEmail] == current_user.email
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :plan => "1",
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Blocapedia customer',
        :currency    => 'usd'
      )

      current_user.update_attribute(:premium, true)
    else
      flash[:notice] = "Your email is incorrect."
      redirect_to new_charge_path
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

end
