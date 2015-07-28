class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.created_events.build(events_params)
  	if @event.save
  	  flash[:success] = "Event saved!"
  	  redirect_to root_url
  	else
  	  render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end


  private
    def events_params
      params.require(:event).permit(:location, :date, :description)
    end

end
