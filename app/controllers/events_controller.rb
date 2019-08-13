class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user
      if @event.save
        redirect_to event_path
      else
        render :new
      end
  end


  private

  def event_params
    event_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end

end
