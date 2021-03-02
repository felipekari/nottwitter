Rails.application.routes.draw do
  resources :tweets do
    resources :likes
    member do
      post :retweet
    end
  end
  get 'home', to: 'pages#home'
  root "pages#home"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
