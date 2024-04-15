Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resource :users, only: [:edit, :update] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
      get "mypage/favorite", :to => "users#favorite"
      get "mypage/reserve", :to => "users#reserve"
      get "mypage/register_card", :to => "users#register_card"
      post "mypage/token", :to => "users#token"
      get "registration", :to => "users#registration"
      post "registration", :to => "users#paid_decision"
      get "premium_cancel", :to => "users#premium_cancel"
      get "unsubscribe", :to => "users#unsubscribe"
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
