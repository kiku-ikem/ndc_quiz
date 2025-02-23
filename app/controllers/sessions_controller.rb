class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:name], params[:password])
    if user
      # Sorceryでログイン成功時
      if params[:from] == 'result'
        redirect_to result_games_path, notice: 'ログインに成功しました（結果画面に戻ります）'
      else
        redirect_to root_path, notice: 'ログインに成功しました'
      end
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
