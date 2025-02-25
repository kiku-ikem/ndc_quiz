Rails.application.routes.draw do
  root 'home#index'
  get 'about',    to: 'pages#about'
  get 'privacy',  to: 'pages#privacy'
  get 'terms',    to: 'pages#terms'

  # ユーザ認証
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # ユーザ登録／マイページ
  get  'signup', to: 'users#new'
  post 'users',  to: 'users#create'
  get  'mypage', to: 'users#show'

  # ゲーム関連（例：ゲーム開始、問題出題、回答、結果表示）
  resources :games, only: [] do
    collection do
      get 'start'
      get 'question'
      match 'answer', via: [:get, :post]
      get 'result'
    end
  end 

  # 図書詳細情報
  resources :books, only: [:show]

  # お気に入り機能
  resources :favorites, only: [:create, :destroy]

  # エラーページです。
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
