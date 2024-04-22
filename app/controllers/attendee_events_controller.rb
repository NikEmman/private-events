class AttendeeEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:create, :destroy]
  

    
  def create
        @attendee_event = @event.attendee_events.build
        @attendee_event.attendee = current_user
        if @attendee_event.save
            redirect_to @event, notice: 'Thanks for attending!'
        else
            render 'events/show'
        end
  end

  def destroy
    @attendee_event = AttendeeEvent.find_by(attendee_id: current_user.id, event_id: params[:id])
    @attendee_event.destroy
    redirect_to @event, notice: 'You have successfully removed your attendance.'
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end
end
