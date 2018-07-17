Rails.application.routes.draw do


  get '/' => 'home#top'#トップ画面
  get '/home' => 'home#top'
  get '/home/top' => 'home#top'
  get '/about' => 'home#about'#このサイトについて
  get '/home/about' => 'home#about'

  post '/users/login' => 'users#login'#ログイン処理
  post '/users/logout' => 'users#logout'#ログアウト処理
  get '/users/login' => 'users#login_form'#ログインフォーム
  get '/users/index' => 'users#index'#メンバー一覧
  get '/users/:id/show' => 'users#show'#メンバー詳細
  get '/users/new' => 'users#new'#メンバー新規登録
  post '/users/create' => 'users#create'
  get '/users/:id/edit' => 'users#edit'#メンバー編集
  post '/users/:id/update' => 'users#update'
  delete '/users/:id/delete' => 'users#delete'#メンバー削除  

  get '/events/index' => 'events#index'#イベント一覧
  get '/events/:id/show' => 'events#show'#イベント詳細
  get '/events/new' => 'events#new'#イベント新規作成
  post '/events/create' => 'events#create'
  get '/events/:id/edit' => 'events#edit'#イベント編集
  post '/events/:id/update' => 'events#update'#イベント更新保存 
  delete '/events/:id/delete' => 'events#delete'#イベント削除
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
