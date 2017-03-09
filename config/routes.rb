Rails.application.routes.draw do

  get '/' => 'user#show'
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :users, only: [:show] do
    resources :portfolio, only: [:create, :update, :show, :new]
  end
end
