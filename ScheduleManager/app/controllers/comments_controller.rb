class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @event = Event.find(params[:event_id])
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to event_path(@event.id)
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id,:comment,:user_name,:image)
  end
end
