module EventsHelper

  def find_event
    Event.find(params[:id])
  end

  def find_price
   Event.find(params[:id]).price
  end

end
