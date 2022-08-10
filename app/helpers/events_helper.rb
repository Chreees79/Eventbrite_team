module EventsHelper

  def find_event
    Event.find(params[:id])
  end

  def find_price
   Event.find(params[:id]).price
  end

  def is_admin?
    @event = find_event
    current_user == @event.admin 
  end

  def is_customer?
    @event = find_event
    @event.customers.include?(current_user)
  end


end
