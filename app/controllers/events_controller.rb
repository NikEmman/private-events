class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :require_permission, only: [:edit, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  

  

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
    
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url(@event), notice: "Event was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end
  
  def event_params
    params.require(:event).permit(:location, :time, :description)
  end

  def require_permission
    if current_user != Event.find(params[:id]).creator
      redirect_to root_path, alert: "You are not the creator of this event"
    end
  end
  
end
