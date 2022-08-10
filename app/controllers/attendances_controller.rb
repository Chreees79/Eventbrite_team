class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
 
  def index
  end

  def new
  end

  def create
    @attendance = Attendance.new
    @attendance.event_id = params[:event_id]
    @attendance.customer_id = current_user.id
    @attendance.save!
  end
end

=begin
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    if @payment_intent.succeeded
      @attendance.save
      redirect_to event_path(params[:event_id]), success: "Vous êtes bien inscrit à l'évènement!"
    else
      redirect_to root_path, alert: "You failed"
    end
rescue => exception
  
=end