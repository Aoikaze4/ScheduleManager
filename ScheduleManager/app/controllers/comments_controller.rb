class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    if user_signed_in?
      @comment = current_user.comments.new(comment_params)
      @comment.event_id = @event.id
      @comment.user_name = current_user.name
    else
      @comment = Comment.new(comment_params)
      @comment.event_id = @event.id
    end

    if @comment.save
      redirect_to event_path(@event.id), notice: "コメントを投稿しました。"
    else
      @users = EventJoinStatus.where(event_id: @event.id)
      @comments = Comment.where(event_id: @event.id).reverse
      @event_join_status = EventJoinStatus.new
      render 'events/show'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.destroy
      redirect_to event_path(comment.event_id), notice: "コメントを削除しました。"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:user_name,:image)
  end
end
