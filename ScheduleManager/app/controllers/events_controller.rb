class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event_join_status = EventJoinStatus.create(
      status: 0,
      )

    if user_signed_in?
      #ユーザーがログインしていれば関連付けしたそのIDと名前をそのまま持ってくる
      @event.user_id = current_user.id
      @event.user_name = current_user.name

      @event_join_status.user_name = current_user.name
      @event_join_status.user_id = current_user.id
    else
      #ログインしていなければ入力されたuser_nameの情報を入れる、user_idは不要
      @event.user_name  = params[:event][:user_name]
      @event_join_status.user_name = @event.user_name
    end


    if @event.save
      if @event_join_status.update(event_id: @event.id)
        redirect_to event_path(@event.id), notice: "イベントを作成しました！URLを共有して予定を入力してもらいましょう！"
      else
        render :new
      end
    else
      render :new
    end
  end


  def show
    @event = Event.find(params[:id])
    @users = EventJoinStatus.where(event_id: @event.id)
    @comments = Comment.where(event_id: @event.id).reverse
    @comment = Comment.new
    @event_join_status = EventJoinStatus.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice: '変更を保存しました。'
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      redirect_to mypage_path, notice: "イベントを削除しました。"
    else
      render root_path
    end
  end


  private
  def event_params
    params.require(:event).permit(:event_name,:event_at,:description,:user_name)
  end
end
