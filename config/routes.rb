Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "admins/aggregate", :to => "admins#aggregate"

  resource :users, only: [:edit, :update] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
      get "mypage/favorite", :to => "users#favorite"
      get "mypage/reserve", :to => "users#reserve"
    end
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "top#index"
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end

  resources :restaurants, only: [:index, :show] do
    resource :likes, only: [:create, :destroy]
    resources :reviews, only: [:create], module: :restaurants
    resources :reservations
  end

  get '*path', controller: 'application', action: 'render_404'

end
