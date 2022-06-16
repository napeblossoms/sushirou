Rails.application.routes.draw do
  #管理者
  devise_for :admin, skip: [:registrations, :passwords],controllers: { #registrationを除外して、新規登録するページを無く
      sessions: "admin/sessions"
  }
  
  #エンドユーザー
  devise_for :end_users
  
  #ゲストログイン
  devise_scope :end_user do 
      post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  root to: "public/post_sushis#index" #TOPページ
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/homes' => 'homes#top'
  namespace :public do
   resources :post_sushis, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
     resources :post_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    #   get 'followed_post_sushis' => 'post_sushis#followed_post_sushis', as: 'followed_post_sushis'
      member do
         get :followings #フォローした人の投稿一覧
      end

      collection do
         get :search
      end
   end

   resources :end_users, only: [:edit, :show, :update] do
     resource :relationships, only: [:create, :destroy]
       get 'followings' => 'relationships#followings', as: 'followings'
       get 'followers' => 'relationships#followers', as: 'followers'

     member do #いいねした投稿一覧
         get :favorites
     end
   end
  end
  
  namespace :admin do
      resources :end_users, only: [:show,:update,:index,:edit] 
      resources :post_sushis, only: [:show,:index,:destroy]
  end
  
end
