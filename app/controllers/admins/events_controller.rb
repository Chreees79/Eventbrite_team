class Admins::EventsController < ApplicationController
  require_relative '../../helpers/events_helper'
  before_action :require_admin
  def index
    @events = Event.all
  end

  def show
    @event = find_event
  end

  def edit
    @event = find_event
  end

  def destroy
    find_event.destroy
    redirect_to admins_path
  end

  def require_admin
    unless current_user.app_admin?
      redirect_to root_path
    end
  end
  private

  def event_params
    params.permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
