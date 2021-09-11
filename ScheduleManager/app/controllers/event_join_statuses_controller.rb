class EventJoinStatusesController < ApplicationController
  def join
    @event = Event.find(params[:id])

    EventJoinStatus.create(
      user_id: current_user.id,
      event_id: @event.id,
      status: 0,
    )
  end

  private
  def event_join_status_param
    params.require(:event_join_status).permit(:user_id, :status, :user_name)
  end
end
