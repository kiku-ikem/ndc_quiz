class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)  # Sorcery の自動ログインメソッド
      if params[:from] == 'result'
        redirect_to result_games_path, notice: "サインアップが完了しました。結果画面に戻ります。"
      else
        redirect_to root_path, notice: "サインアップが完了しました。"
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
