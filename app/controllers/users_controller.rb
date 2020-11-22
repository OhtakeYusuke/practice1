class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_url, notice: "新規ユーザ登録が完了しました"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end
end
