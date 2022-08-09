module EventsHelper

  def find_event
    Event.find(params[:id])
  end

end
