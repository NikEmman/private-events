class AttendeeEventsController < ApplicationController
  before_action :set_event, only: :create

    
  def create
        @attendee_event = @event.attendee_events.build
      # set the user id equal to the current user
        @attendee_event.attendee = current_user
        if @attendee_event.save
            redirect_to @event
        else
            render 'events/show'
        end
  end
  private
  def set_event
        @event = Event.find(params[:event_id])
  end
end
