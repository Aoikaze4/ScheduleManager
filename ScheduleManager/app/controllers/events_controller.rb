class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    binding.pry
    if user_signed_in?
      @event.user_id = current_user.id
      @event.user_name = current_user.name
    else
      @event.user_name = params[:event][:user_name]
    end

    if @event.save!
      redirect_to event_path(@event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
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
