Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  root "pages#home"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
