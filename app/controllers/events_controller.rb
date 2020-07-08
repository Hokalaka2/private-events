class EventsController < ApplicationController
    def new
        @event = Event.new
    end
    def create
        @event = User.find(session[:user_id]).events.build(event_params)
        if @event.save
            redirect_to events_path
        else
            render new_user_path
        end
    end
    def show
        @event = Event.find(params[:id])
    end
    def index
        @events = Event.all
    end

    def event_params
        params.require(:event).permit(:description, :eventdate)
    end
end
