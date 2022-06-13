Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  root to: "public/post_sushis#index" #TOPページ
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
end
