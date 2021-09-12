class EventJoinStatusesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    event_join_status = EventJoinStatus.create(
      event_id: @event.id,
      status: 0,
    )

    if user_signed_in? && params[:user_name].blank?
      event_join_status.user_id = current_user.id
      event_join_status.user_name = current_user.name
    else
      event_join_status.user_name = params[:event_join_status][:user_name]
    end

    if event_join_status.save!
      redirect_to event_path(@event.id)
    end
  end

  def update
    event_join_status = EventJoinStatus.find(params[:id])
    event = event_join_status.event_id
    if event_join_status.update(event_join_status_params)
      redirect_to event_path(event)
    end
  end

  private
  def event_join_status_params
    params.require(:event_join_status).permit(:user_id, :status, :user_name)
  end
end
