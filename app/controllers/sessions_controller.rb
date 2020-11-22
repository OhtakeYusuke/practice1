class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email], password_digest: session_params[:password_digest])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_user_url, notice: "ログアウトしました"
  end


  private
  def session_params
    params.require(:session).permit(:email, :password_digest)
  end
end
