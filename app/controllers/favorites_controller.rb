class FavoritesController < ApplicationController
  before_action :require_login

  def create
    # 例: 現在のユーザーがお気に入り登録されていないかチェックしてから登録
    @favorite = current_user.favorites.build(book_id: params[:book_id])
    if @favorite.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to request.referer, notice: 'お気に入り登録しました。' }
      end
    else
      # エラー処理
      head :unprocessable_entity
    end
  end

  def destroy
    # params[:id] で Favorite レコードの ID が渡されるので、それを使って取得
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer, notice: 'お気に入り解除しました。' }
    end
  end
end
