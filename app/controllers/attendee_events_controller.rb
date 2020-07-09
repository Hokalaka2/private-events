class AttendeeEventsController < ApplicationController
    def create
        @attendee_event = AttendeeEvent.new(attendee_event_params)
        @attendee_event.save
        redirect_to event_path(attendee_event_params[:event_id])
    end

    def attendee_event_params
        params.require(:attendee_event).permit(:attendee_id, :event_id)
    end
end
