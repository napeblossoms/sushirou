Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users
  root to: "public/post_sushis#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :public do
   resources :post_sushis, only: [:new, :create, :index, :edit, :show, :update, :destroy] do
     resources :post_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
   end

   resources :end_users, only: [:edit, :show, :update]
  end
end
