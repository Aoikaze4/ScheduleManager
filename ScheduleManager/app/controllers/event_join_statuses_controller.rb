class EventJoinStatusesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    @event_join_status = EventJoinStatus.create(
      event_id: @event.id,
    )

    @event_join_status.update(event_join_status_params)

    if @event_join_status.save
      redirect_to event_path(@event.id), notice: "ユーザーの予定を追加しました。"
    else

      @users = EventJoinStatus.where(event_id: @event.id)
      @comments = Comment.where(event_id: @event.id).reverse
      @comment = Comment.new
      render 'events/show'
    end
  end

  def update
    event_join_status = EventJoinStatus.find(params[:id])
    if event_join_status.update(event_join_status_params)
      redirect_to event_path(event_join_status.event_id), notice: "予定を変更しました。"
    end
  end

  def destroy
    event_join_status = EventJoinStatus.find(params[:id])
    if event_join_status.destroy
      redirect_to event_path(event_join_status.event_id), notice: "予定を削除しました。"
    end
  end


  private
  def event_join_status_params
    params.require(:event_join_status).permit(:user_id, :status, :user_name)
  end
end
