class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @user = User.find(current_user.id)
    if user_signed_in?
      @events = EventJoinStatus.where(user_id: current_user.id)
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypage_path, notice: "編集が完了しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:image)
  end
end
