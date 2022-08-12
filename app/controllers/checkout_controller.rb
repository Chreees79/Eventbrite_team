class CheckoutController < ApplicationController
  def create
    @event = find_event
    StoreId.new.store(@event.id)
    @price = find_price
    # event = Event.find(params[:event]).as_json
    @session = Stripe::Checkout::Session.create(
      # metadata: {event: event["id"]},
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'coucou',
          currency: 'eur',
          amount: (@price * 100),
          quantity: 1
        },
      ],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: root_url,
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    StoreId.new.create(current_user.id)
  end

  def cancel; end
end
