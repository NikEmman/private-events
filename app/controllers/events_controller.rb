class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create 
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "Event was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:location, :time, :description)
  end
end
