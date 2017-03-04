Rails.application.routes.draw do

  get '/' => 'users#index'
  devise_for :users, controllers: { registrations: 'user/registrations' }
  # resources :user
end
