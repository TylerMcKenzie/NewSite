Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'user#index'
  resources :user
  # get '/' => 'user#index'
  # post '/new' => 'user#new'
end
