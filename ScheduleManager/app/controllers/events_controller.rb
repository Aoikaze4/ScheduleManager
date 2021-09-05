class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    #@を外してもいいかも（特に不要そうであれば）
    @event = Event.new(event_params)
    if user_signed_in?
      #ユーザーがログインしていれば関連付けしたそのIDと名前をそのまま持ってくる
      @event.user_id = current_user.id
      @event.user_name = current_user.name
    else
      #ログインしていなければ入力されたuser_nameの情報を入れる、user_idは不要
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

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to event_path(event.id), notice: '変更を保存しました。'
    else
      render :egit
    end
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
