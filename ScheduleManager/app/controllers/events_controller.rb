class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    if event.save!
      redirect_to event_path(event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      redirect_to root_path
    else
      render root_path
    end
  end


  private
  def event_params
    params.require(:event).permit(:event_name,:event_at,:description,:user_name)
  end
end
