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

  private
  def event_params

  end
end
