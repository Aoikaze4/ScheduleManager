class EventJoinStatusesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    event_join_status = EventJoinStatus.create(
      event_id: @event.id,
    )

    event_join_status.update(event_join_status_params)

    if event_join_status.save!
      redirect_to event_path(@event.id)
    end
  end

  def update
    event_join_status = EventJoinStatus.find(params[:id])
    if event_join_status.update(event_join_status_params)
      redirect_to event_path(event_join_status.event_id)
    end
  end

  def destroy
    event_join_status = EventJoinStatus.find(params[:id])
    if event_join_status.destroy
      redirect_to event_path(event_join_status.event_id)
    end
  end


  private
  def event_join_status_params
    params.require(:event_join_status).permit(:user_id, :status, :user_name)
  end
end
