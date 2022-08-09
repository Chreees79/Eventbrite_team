class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user
    if @event.save
      redirect_to event_path(@event.id), success: "Votre event est crééeééeéée!"
    else
      redirect_to new_event_path, alert: "You failed"
    end
  end

  def show
    @event = find_event
  end
  
  private

  def event_params
    params.permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
